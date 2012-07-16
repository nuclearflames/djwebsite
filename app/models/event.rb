class Event < ActiveRecord::Base
  attr_accessible :title, :description, :event_date
  
  validates_presence_of :title, :description, :event_date
  
  
end
