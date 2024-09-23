class CreateRatePlans < ActiveRecord::Migration[7.2]
  def change
    create_table :rate_plans do |t|
      t.references :room, null: false, foreign_key: true
      t.string :name
      t.string :slug
      t.text :detail
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
