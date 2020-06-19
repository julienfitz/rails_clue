class Character < ApplicationRecord
  has_many :guestbook_entries
  has_many :rooms, through: :guestbook_entries
  has_one :weapon
  belongs_to :envelope, optional: true

  def self.default_scope
    where(envelope: nil)
  end
end
