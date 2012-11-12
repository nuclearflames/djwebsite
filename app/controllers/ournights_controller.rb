class OurnightsController < ApplicationController
  def index
	@user = User.find_by_email("keane-sounds@hotmail.co.uk")
  end
end
