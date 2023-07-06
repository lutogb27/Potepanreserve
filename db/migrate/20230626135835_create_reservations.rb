class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :user_id
      t.string :room_id
      t.date :checkin_at
      t.date :checkout_at
      t.integer :person_count

      t.timestamps
    end
  end
end
