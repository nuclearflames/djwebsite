class AboutusController < ApplicationController
  def index
	@owner = User.find_by_email("keane-sounds@hotmail.co.uk")
  end
end
