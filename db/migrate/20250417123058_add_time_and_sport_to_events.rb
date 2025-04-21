class AddTimeAndSportToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :event_time, :datetime
    add_column :events, :sport_type, :string
  end
end
