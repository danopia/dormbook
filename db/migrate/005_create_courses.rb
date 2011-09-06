class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.string :title, :null => false
      t.string :category, :null => false
      t.string :level, :null => false
      t.string :section, :null => false
      t.string :crn, :null => false
      t.integer :credits, :null => false, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
