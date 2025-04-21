class AddUserToRsvps < ActiveRecord::Migration[8.0]
  def change
    add_reference :rsvps, :user, null: false, foreign_key: true
  end
end
