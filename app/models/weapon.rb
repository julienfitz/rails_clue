class Weapon < ApplicationRecord
  belongs_to :character
  belongs_to :envelope, optional: true

  def self.default_scope
    where(envelope: nil)
  end
end
