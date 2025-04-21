class RemoveEmailFromRsvps < ActiveRecord::Migration[8.0]
  def change
    remove_column :rsvps, :email, :string
  end
end
