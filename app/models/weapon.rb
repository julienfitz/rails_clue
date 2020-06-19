class Weapon < ApplicationRecord
  belongs_to :character
  belongs_to :envelope, optional: true
end
