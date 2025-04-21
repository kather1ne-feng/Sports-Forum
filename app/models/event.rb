class Event < ApplicationRecord
  SPORT_TYPES =  [ "Basketball", "Soccer", "Football", "Baseball", "Hockey", "Golf", "Volleyball", "Tennis", "Ultimate Frisbee", "Pickleball", "Other" ]
  # owner of the event
  belongs_to :user

  has_many :rsvps, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :featured_image
  has_rich_text :description

  validates :name, :event_time, :sport_type, :location, presence: true

  after_update_commit :notify_rsvps, if: :updated?

  def updated?
    saved_change_to_name? || saved_change_to_event_time? || saved_change_to_location? || saved_change_to_sport_type? || (description && description.body_previously_changed?)
  end

  def notify_rsvps
    rsvps.includes(:user).each do |rsvp|
      EventMailer.with(event: self, user: rsvp.user).event_notif.deliver_now
    end
  end
end
