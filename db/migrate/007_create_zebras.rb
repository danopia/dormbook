class CreateZebras < ActiveRecord::Migration
  def self.up
    create_table :zebras do |t|
      t.integer :roomie_id, :null => false
      t.integer :session_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :zebras
  end
end
