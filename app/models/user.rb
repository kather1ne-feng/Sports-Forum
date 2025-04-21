class User < ApplicationRecord
  has_secure_password

  has_many :sessions, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :rsvps, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :username, presence: true, uniqueness: true
  validates :email_address, presence: true, uniqueness: true
end
