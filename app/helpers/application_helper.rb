module ApplicationHelper
	def loginout
		if current_user
			link_to "Logout", "../../logout"
		else
			link_to "Login", "../../login"
		end
	end
	
	def isAdmin
		if current_user
			@user = User.find(current_user)
			if @user.administrator = true
				return true
			else
				return false
			end
		end
	end
end
