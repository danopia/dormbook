class CreateRoomies < ActiveRecord::Migration
  def self.up
    create_table :roomies do |t|
      t.string :name
      t.integer :building_id
      t.string :room
      t.integer :index

      t.timestamps
    end
  end

  def self.down
    drop_table :roomies
  end
end
