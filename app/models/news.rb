class News < ActiveRecord::Base
  attr_accessible :content, :title
  
  validates_presence_of :title, :content
  
  def self.user_id
	user_id = current_user.id
end
