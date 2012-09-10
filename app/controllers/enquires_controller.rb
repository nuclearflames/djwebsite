class EnquiresController < ApplicationController
	def index
		EnquiresForm.make_enquiry(params[:enquires][:description]).deliver
		flash.now[:notice] = "Enquiry Sent, thank you"
	end

end
