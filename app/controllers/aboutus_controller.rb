class AboutusController < ApplicationController
  def index
	@owner = User.find_by_email("keanesounds@hotmail.co.uk")
  end
end
