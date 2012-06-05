class ApplicationController < ActionController::Base
	protect_from_forgery
	helper_method :current_user_session, :current_user
	
	
	protected
	def current_user_session
		@current_user_session ||= UserSession.find
	end
	
	def current_user
		@current_user ||= current_user_session && current_user_session.user
	end
	
	def authenticate
		unless current_user
			redirect_to new_user_session_path
			flash[:notice] = 'Please Logon to view this page'
			return false
		end
	end
end