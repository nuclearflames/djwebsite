class AboutusController < ApplicationController
  def index
	@owner = User.find_by_forename("James")
  end
end
