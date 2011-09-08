class Professor < ActiveRecord::Base
  has_many :sessions
  
  def self.find_or_create name
    find_by_name(name) || create(:name => name)
  end
end
