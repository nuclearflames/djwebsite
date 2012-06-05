module ApplicationHelper
	def loginout
		if current_user
			link_to "Logout", "../../logout"
		else
			link_to "Login", "../../login"
		end
	end
end
