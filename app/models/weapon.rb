class Weapon < ApplicationRecord
  belongs_to :character
  has_one :envelope

  def is_murder_weapon?
    id == Envelope.last.weapon_id
  end
end
