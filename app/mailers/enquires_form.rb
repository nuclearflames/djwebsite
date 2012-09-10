class EnquiresForm < ActionMailer::Base
	default from: "nuclearflamesweb-djwebsite@yahoo.com"
	
	def make_enquiry(details)
		@details = details
		mail(
		:to => "jamesgrant1993@yahoo.com",
		:subject => "Bookings enquiry",
		)
	end
end
