class RegistrationMailer < ActionMailer::Base
  default from: "nuclearflamesweb-djwebsite@yahoo.com"

EMAIL_VERIFICATION_URL = 'http://keane-sounds.com/users/new?code='
  
	def registration_email(user)
		@user = user
		@url = EMAIL_VERIFICATION_URL + @user.id.to_s + '_' + @user.create_digest(@user.id.to_s)
		mail(	
			:to => @user.email,
			:from => "nuclearflamesweb-djwebsite@yahoo.com",
			:subject => "Please Activate your account",
		)
	end
end
