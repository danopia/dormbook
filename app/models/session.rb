class Session < ActiveRecord::Base
  belongs_to :course
  belongs_to :professor
  has_many :zebras
  has_many :schedules, :through => :zebras
  
  def self.find_or_create stuff
    # ["The Drexel Experience", "UNIV", "E101", "D", "13340", "1.000", "2:00 pm", "2:50 pm", "F", "Bossone Research Entr. Center AUD", "Lecture", "Kelly L. Vass (P), Terri A. Baker "]
    c = Course.find_or_create stuff.shift(6)
    
    # ["2:00 pm", "2:50 pm", "F", "Bossone Research Entr. Center AUD", "Lecture", "Kelly L. Vass (P), Terri A. Baker "]
    p = Professor.find_or_create stuff.last.sub('(P)', '').sub('E-mail', '').strip if stuff.last != 'TBA'
    
    # ["2:00 pm", "2:50 pm", "F", "Bossone Research Entr. Center AUD", "Lecture", "Kelly L. Vass (P), Terri A. Baker "]
    data = {
      :course_id => c.id,
      :starts_at => Time.parse("2000-01-01 #{stuff.shift.strip} UTC"),
      :ends_at => Time.parse("2000-01-01 #{stuff.shift.strip} UTC"),
      :days => stuff.shift.strip,
      :location => stuff.shift.strip,
      :_type => stuff.shift.strip}
    
    s = Session.first :conditions => data
    s ||= Session.create data
    
    s.update_attributes :professor_id => p.id if p
    
    s
  end
  
  def days_s
    d = days.split('')
    
    a = []
    a << 'Mondays' if d.include? 'M'
    a << 'Tuesdays' if d.include? 'T'
    a << 'Wednesdays' if d.include? 'W'
    a << 'Thursdays' if d.include? 'R'
    a << 'Fridays' if d.include? 'F'
    
    return a.first if a.size == 1
    
    b, c = a.pop(2)
    a << "#{b} and #{c}"
    
    a.join ', '
  end
end
