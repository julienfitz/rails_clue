# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating characters!"
puts "* * * * * * * * * * *"
characters = Character.create!(
  [
    { name: 'Miss Scarlett' },
    { name: 'Mr. Green' },
    { name: 'Colonel Mustard' },
    { name: 'Professor Plum' },
    { name: 'Mrs. Peacock' },
    { name: 'Mrs. White' },
    { name: 'Dr. Orchid' },
    { name: 'Tim Curry' },
    { name: 'The Butler' },
    { name: 'Mr. Boddy' }
  ]
).shuffle

characters.each do |c|
  puts c.name
end

puts "Creating weapons!"
puts "* * * * * * * * * * *"

weapons = Weapon.create!(
  [
    { name: 'candlestick', character: characters[0] },
    { name: 'dagger', character: characters[1] },
    { name: 'lead pipe', character: characters[2] },
    { name: 'revolver', character: characters[3] },
    { name: 'rope', character: characters[4] },
    { name: 'wrench', character: characters[5] }
  ]
).shuffle

weapons.each do |w|
  puts w.name
end

puts "Creating rooms!"
puts "* * * * * * * * * * *"

rooms = Room.create!(
  [
    { name: 'Kitchen' },
    { name: 'Ballroom' },
    { name: 'Conservatory' },
    { name: 'Dining Room' },
    { name: 'Cellar' },
    { name: 'Billiard Room' },
    { name: 'Library' },
    { name: 'Study' },
    { name: 'Lounge' },
    { name: 'Hall' }
  ]
)

rooms.each do |r|
  puts r.name
end

puts "Creating envelope! SSSSSH... it's a secret!"

envelope = Envelope.create(character: characters.sample, weapon: weapons.sample, room: rooms.sample)

puts "Assigning weapons to characters!"
puts "There are #{Weapon.count} weapons to be assigned!"
weapons
  .filter { |w| w.id != envelope.weapon.id }
  .shuffle
  .each_with_index do |weapon, index|
    char = characters.filter { |c| c.id != envelope.character.id }[index]
    if !char.nil?
      weapon.character = char
    end
    weapon.save!
end

puts "Assigning rooms to characters!"

rooms
  .filter { |r| r.id != envelope.room.id }
  .shuffle
  .each_with_index do |room, index|
    char = characters.filter { |c| c.id != envelope.character.id }[index]
    if !char.nil?
      GuestbookEntry.create!(character: char, room: room)
    end
end

puts "There are now #{Character.count} characters!"
puts "There are now #{Room.count} rooms!"
puts "There are now #{Weapon.count} weapons!"
puts "There are now #{GuestbookEntry.count} guestbook entries!"
puts "Done! Happy sleuthing!"
