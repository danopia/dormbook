class Roomie < ActiveRecord::Base
	belongs_to :building

  validates_presence_of :name, :building_id, :room, :index
  validates_associated :building
  validates_uniqueness_of :name

  def parse_str raw
	  raw = raw.strip.split('-')
	  
	  code = raw[0][1..-1].to_i
	  code = 1 if raw[0] == 'RACE'
    self.building = Building.find_by_number(code) if code > 0
    self.room = raw[1]
    self.index = raw[2].to_i if raw[2] && raw[2].size == 1
  end
  
  def floor; room.match(/[0-9]{3,4}/).to_s[0..-3].to_i rescue 0; end
  def room_i; room.match(/[0-9]{3,4}/).to_s.to_i rescue 0; end
end

