class GuestbookEntry < ApplicationRecord
  belongs_to :character
  belongs_to :room
end
