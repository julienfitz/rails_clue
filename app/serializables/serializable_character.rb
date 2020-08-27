class SerializableCharacter < JSONAPI::Serializable::Resource
  type 'character'

  attributes :name

  has_many :guestbook_entries
  has_many :rooms
  has_one :weapon
  has_one :envelope
end