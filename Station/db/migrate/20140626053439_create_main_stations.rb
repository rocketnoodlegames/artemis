class CreateMainStations < ActiveRecord::Migration
  def change
    create_table :main_stations do |t|
      t.string :name
      t.integer :money
      t.integer :size
      t.integer :defense
      t.integer :armor
      t.integer :shields
      t.integer :weapons
      t.integer :ships
      t.integer :medical
      t.integer :enemy

      t.timestamps
    end
  end
end
