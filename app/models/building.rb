class Building < ActiveRecord::Base
	has_many :roomies, :class_name => 'Roomie'
	
  validates_presence_of :name, :number
end
