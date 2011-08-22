class AddFacebook < ActiveRecord::Migration
  def self.up
    add_column :roomies, :fb_id, :string
    add_column :roomies, :email, :string
    
    add_column :buildings, :fb_id, :string
    
    Building.find_by_name('Millennium').update_attributes :fb_id => '273755885972661'
    Building.find_by_name('Myers').update_attributes :fb_id => '264702770207577'
    Building.find_by_name('Kelly').update_attributes :fb_id => '137536616336887'
    Building.find_by_name('Race').update_attributes :fb_id => '246962131993176'
    Building.find_by_name('Towers').update_attributes :fb_id => '193047790757620'
    Building.find_by_name('Calhoun').update_attributes :fb_id => '180169432051764'
    Building.find_by_name('Van R').update_attributes :fb_id => '238600186179115'
  end

  def self.down
    remove_column :roomies, :fb_id
    remove_column :roomies, :email
    
    remove_column :buildings, :fb_id
  end
end
