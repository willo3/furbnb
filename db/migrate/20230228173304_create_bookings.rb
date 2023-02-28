class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :start_time
      t.date :end_time
      t.references :user_id, null: false, foreign_key: true
      t.references :pet_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
