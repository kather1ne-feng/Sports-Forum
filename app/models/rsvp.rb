class Rsvp < ApplicationRecord
  belongs_to :event
  belongs_to :user
  generates_token_for :unrsvp

  validates :user_id, uniqueness: { scope: :event_id, message: "has already joined this event" }
end
