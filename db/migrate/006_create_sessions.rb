class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.integer :course_id, :null => false
      t.time :starts_at, :null => false
      t.time :ends_at, :null => false
      t.string :days, :null => false
      t.string :location, :null => false
      t.integer :professor_id
      t.string :_type, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :sessions
  end
end
