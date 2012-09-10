class EnquiresController < ApplicationController
	def index
	end
	
	def new
		EnquiresForm.make_enquiry(params[:enquires][:description]).deliver
		redirect_to :action => "index"
		flash[:notice] = "Enquiry Sent, thank you"
	end
end
