class ContactusController < ApplicationController
  def index
	@user = User.find_by_forename("James")
  end
end
