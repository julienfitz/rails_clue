class Room < ApplicationRecord
  has_many :guestbook_entries
  has_many :characters, through: :guestbook_entries
  belongs_to :envelope, optional: true
end
