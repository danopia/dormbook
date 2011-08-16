class Building < ActiveRecord::Base
	has_many :roomies, :class_name => 'Roomie'
end
