class Zebra < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :session
end
