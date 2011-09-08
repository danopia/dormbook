class Course < ActiveRecord::Base
  has_many :sessions
  
  def self.find_or_create stuff
    # ["The Drexel Experience", "UNIV", "E101", "D", "13340", "1.000"]
    data = {
      :title => stuff.shift,
      :category => stuff.shift,
      :level => stuff.shift,
      :section => stuff.shift}
    
    s = Course.first :conditions => data
    s ||= Course.create data
    s
  end
end
