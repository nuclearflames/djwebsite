class HomeController < ApplicationController
  def index
	  @events = Event.find(:all, :conditions => ["event_date >= ?", Date.today.to_s], :order => "event_date ASC", :limit => 4)
	  @news = News.find(:all)
  end
end
