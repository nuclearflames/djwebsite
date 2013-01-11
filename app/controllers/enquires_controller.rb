class EnquiresController < ApplicationController
	def index
	end
	
	def new
		if params[:enquires][:description] != ""
			EnquiresForm.make_enquiry(params[:enquires][:description]).deliver
			redirect_to :action => "index"
			flash[:notice] = "Enquiry Sent, thank you"
		else
			redirect_to :action => "index"
			flash[:notice] = "Please put something into the enquiry form!"
		end
	end
end
