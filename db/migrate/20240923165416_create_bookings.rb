class CreateBookings < ActiveRecord::Migration[7.2]
  def change
    create_table :bookings do |t|
      t.references :room, null: false, foreign_key: true
      t.references :rate_plan, null: false, foreign_key: true
      t.references :calendar, null: false, foreign_key: true
      t.string :reservation_number
      t.datetime :reservation_date
      t.datetime :check_in
      t.datetime :check_out
      t.string :name
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
