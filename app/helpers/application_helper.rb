module ApplicationHelper
	def loginout
		if current_user
			link_to "Logout", "../../logout"
		else
			link_to "Login", "../../login"
		end
	end
	
	def isHomepage(url)
		if url == "/"
			return true
		else
			return false
		end
	end

	def processBreadcrumb(url)
		splitUrl = url.split("/")
		return splitUrl[1]
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
