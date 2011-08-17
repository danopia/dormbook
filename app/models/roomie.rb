class Roomie < ActiveRecord::Base
	belongs_to :building

  validates_presence_of :name, :building_id, :room, :index
  validates_associated :building
  validates_uniqueness_of :name

  def parse_str raw
	  raw = raw.strip.split('-')
	  
    self.building = Building.find_by_number(raw[0][1..-1].to_i)
    self.room = raw[1]
    self.index = raw[2].to_i
  end
  
  def floor; room.match(/[0-9]{3,4}/).to_s[0..-3].to_i rescue 0; end
  def room_i; room.match(/[0-9]{3,4}/).to_s.to_i rescue 0; end
end

