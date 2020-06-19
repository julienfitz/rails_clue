class Envelope < ApplicationRecord
  has_one :character
  has_one :weapon
  has_one :room

  def whodunnit
    str =  "It was #{character.name}! In the #{room.name}! With the #{weapon.name}!"
    puts "\e[31m#{str}\e[0m"
  end
end
