class Envelope < ApplicationRecord
  belongs_to :character
  belongs_to :weapon
  belongs_to :room

  def whodunnit
    str =  "It was #{character.name}! In the #{room.name}! With the #{weapon.name}!"
    puts "\e[31m#{str}\e[0m"
  end
end
