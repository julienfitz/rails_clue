class Room < ApplicationRecord
  has_many :guestbook_entries
  has_many :characters, through: :guestbook_entries
  has_one :envelope

  def is_scene_of_the_crime?
    id == Envelope.last.room_id
  end
end
