class EnquiresForm < ActionMailer::Base
	default from: "nuclearflamesweb-keanesounds@yahoo.com"
	
	def make_enquiry(details)
		@details = details
		mail(
		:to => "keanesounds@hotmail.co.uk",
		:subject => "Bookings enquiry",
		)
	end
end
