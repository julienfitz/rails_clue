class Character < ApplicationRecord
  has_many :guestbook_entries
  has_many :rooms, through: :guestbook_entries
  has_one :weapon
  has_one :envelope

  def is_murderer?
    id == Envelope.last.character_id
  end
end