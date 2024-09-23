class CreateCalendars < ActiveRecord::Migration[7.2]
  def change
    create_table :calendars do |t|
      t.references :room, null: false, foreign_key: true
      t.references :rate_plan, null: false, foreign_key: true
      t.date :date
      t.integer :availability
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
