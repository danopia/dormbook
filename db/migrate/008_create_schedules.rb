class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.integer :roomie_id, :null => false
      t.string :term, :null => false
      t.integer :year, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :schedules
  end
end
