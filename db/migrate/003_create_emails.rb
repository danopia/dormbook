class CreateEmails < ActiveRecord::Migration
  def self.up
    create_table :emails do |t|
      t.string :from
      t.text :message
      t.string :signature
      t.string :subject
      t.integer :roomie_id
      t.boolean :processed

      t.timestamps
    end
    
    add_column :roomies, :gender, :string
  end

  def self.down
    drop_table :emails
    
    remove_column :roomies, :gender
  end
end
