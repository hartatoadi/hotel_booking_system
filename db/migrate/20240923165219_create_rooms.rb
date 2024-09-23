class CreateRooms < ActiveRecord::Migration[7.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.text :feature
      t.boolean :published
      t.integer :availability
      t.text :images

      t.timestamps
    end
  end
end
