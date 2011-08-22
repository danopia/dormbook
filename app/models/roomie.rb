class Roomie < ActiveRecord::Base
	belongs_to :building
  has_many :emails

  validates_presence_of :name, :room, :index
  validates_presence_of :building_id, :message => 'is not known'
  validates_associated :building
  validates_uniqueness_of :name
  validates_uniqueness_of :fb_id, :email, :allow_nil => true
  validates_uniqueness_of :index, :scope => [:building_id, :room]
  validates_numericality_of :index, :greater_than => 0

  def parse_str raw
	  raw = raw.strip.split('-')
	  return nil unless raw.any?
	  
	  code = raw[0][1..-1].to_i
	  code = 1 if raw[0] == 'RACE'
    self.building = Building.find_by_number(code) if code > 0
    self.room = raw[1]
    self.index = raw[2].to_i if raw[2] && raw[2].size == 1
  end
  
  def raw_string; @raw_string; end
  def raw_string= raw; parse_str raw; @raw_string = raw; end
  
  def floor; room_s[0..-3].to_i rescue 0; end
  def room_i; room_s.to_i rescue 0; end
  def room_s; @_room ||= room.match(/[0-9]{3,4}/).to_s rescue ''; end
  
  def find
    Roomie.first(:conditions => {
      :building_id => self.building_id,
      :room => self.room,
      :index => self.index})
  end
end

