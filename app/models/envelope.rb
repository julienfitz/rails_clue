class Envelope < ApplicationRecord
  has_one :character
  has_one :weapon
  has_one :room
end
