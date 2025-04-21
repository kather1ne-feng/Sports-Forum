class CreateRsvps < ActiveRecord::Migration[8.0]
  def change
    create_table :rsvps do |t|
      t.belongs_to :event, null: false, foreign_key: true
      t.string :email

      t.timestamps
    end
  end
end
