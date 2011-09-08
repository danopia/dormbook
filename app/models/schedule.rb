class Schedule < ActiveRecord::Base
  has_many :zebras
  has_many :sessions, :through => :zebras
  belongs_to :roomie
  
  attr_reader :raw_string
  def raw_string= raw
    @raw_string = raw
    
    trash, self.term, self.year = raw.match(/^(Fall|Spring|Summer|Winter) (?:Quarter|Term) ([0-9]{2})-[0-9]{2}\r$/).to_a
    
    p raw
    raw = raw.scan(/(.+) - ([A-Z]+) (.+) - (.+)\r\n.+\r\nCRN: ?\t([0-9]+)\r\n.+\r\n.+\r\n.+\r\nCredits: ?\t ([0-9.]+)\r\n.+\r\n.+\r\n.+\r\n.+\r\nClass ?\t([0-9: apm]+) - ([0-9: apm]+) ?\t([MTWRF]+) ?\t([^\t]+) ?\t[^\t]+ ?\t([^\t]+) ?\t([^\t\r\n]+)/)
    
    @sessions = raw.map do |stuff|
      # ["The Drexel Experience", "UNIV", "E101", "D", "13340", "1.000", "2:00 pm", "2:50 pm", "F", "Bossone Research Entr. Center AUD", "Lecture", "Kelly L. Vass (P), Terri A. Baker "]
      
      s = Session.find_or_create stuff
      Zebra.new :session => s, :schedule => self
    end
  end
  
  def after_save
    @sessions.each(&:save)
  end
end

