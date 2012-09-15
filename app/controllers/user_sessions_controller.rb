class UserSessionsController < ApplicationController
	before_filter :authenticate, :only => :destroy
	
	def new
		@user_session = UserSession.new
	end
	
	def create
		if !current_user
			@user = User.find_by_email(params['user_session'].values)
			@user_session = UserSession.new(params[:user_session])
			if @user
				if @user.activated == false
					redirect_to login_path
					flash[:notice] = 'Activate your account to log in.'
				elsif @user.activated != false and @user_session.save
					redirect_to user_path(current_user)
					flash[:notice] = 'Logged in.'
				else
					redirect_to login_path
					flash[:notice] = 'Failed Log in.'
				end
			else
				redirect_to login_path
				flash[:notice] = 'Failed Log in.'
			end
		else current_user
			if current_user.activated == false
				current_user_session.destroy
				redirect_to login_path
				flash[:notice] = "Your account needs re-activating"
			else
				@user_session = UserSession.new(params[:user_session])
				if @user_session.save
					session[:edit] = true;
					redirect_to edit_user_path(current_user)
					flash[:notice] = 'Validated edit attempt.'
				else
					redirect_to login_path
					flash[:notice] = 'Failed edit login attempt.'
				end
			end
		end	
	end
	
	def destroy
		current_user_session.destroy
		redirect_to login_path
		flash[:notice] = 'Logged Out.'
	end
end
