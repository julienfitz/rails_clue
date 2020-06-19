class Room < ApplicationRecord
  has_many :guestbook_entries
  has_many :characters, through: :guestbook_entries
  belongs_to :envelope, optional: true

  def self.default_scope
    where(envelope: nil)
  end
end
