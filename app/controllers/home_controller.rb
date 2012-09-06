class HomeController < ApplicationController
  layout :value
  def index
	  def value 
		  "home"
	  end
	  @events = Event.find(:all, :conditions => ["event_date >= ?", Date.today.to_s], :order => "event_date ASC", :limit => 4)
	  @news = News.find(:all, :order => "created_at ASC", :limit => 4)
  end
  def v1
	  def value 
		  "application"
	  end
	  @events = Event.find(:all, :conditions => ["event_date >= ?", Date.today.to_s], :order => "event_date ASC", :limit => 4)
	  @news = News.find(:all, :order => "created_at ASC", :limit => 4)
  end
end
