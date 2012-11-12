class OurnightsController < ApplicationController
  def index
	@user = User.find_by_email("keanesounds@hotmail.co.uk")
  end
end
