class Email < ActiveRecord::Base
  belongs_to :roomie
  
  validates_presence_of :subject, :from, :message, :signature
  validates_uniqueness_of :roomie_id
  
  def process!
    return if processed
    
    me = Roomie.new
    me.raw_string = message.match(/R[0-9ACE]{2,3}-[^\-]{3,15}-[0-9]/)[0]
    me = me.find || me
    me.name = message.match(/<div>([^<]+)<p>/)[1]
    
    if match = message.match(/"(.+), M([rs]) (.+)"/)
      me.name = "#{match[3]} #{match[1]}"
      me.gender = (match[2] == 'r') ? 'm' : 'f'
    end
    
    me.save
    
    message.scan(/^ ?(.+), M([rs]) (.+) (R[0-9ACE]{2,3}-[^\-]{3,15}-[0-9]) ([^@ ]+@drexel\.edu)/).map do |caps|
      other = Roomie.new
      other.raw_string = caps[3]
      other = other.find || other
      other.name = "#{caps[2]} #{caps[0]}"
      other.gender = (caps[1] == 'r') ? 'm' : 'f'
      other.save
    end
    
    update_attributes :from => e.message.match(/^From:.*<(.+)>.*$/)[1] if e.message.match(/^From:.*<(.+)>.*$/)
    update_attributes :processed => true, :roomie_id => me.id
    
    Mailer.success(self).deliver
  
  rescue => ex
    Mailer.failure(self).deliver
  end
end

