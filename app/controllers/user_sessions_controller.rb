class UserSessionsController < ApplicationController
	before_filter :authenticate, :only => :destroy
	
	def new
		@user_session = UserSession.new
	end
	
	def create
	@user_session = UserSession.new(params[:user_session])
		if @user_session.save
			redirect_to user_path(current_user)
		else
			render :action => :new
		end
	end
	
	def destroy
		current_user_session.destroy
		redirect_to login_path
		flash[:notice] = 'Logged Out.'
	end
end
