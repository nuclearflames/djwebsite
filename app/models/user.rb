class User < ActiveRecord::Base
	acts_as_authentic do |config|
		config.crypto_provider = Authlogic::CryptoProviders::MD5
	end
	
	
	attr_accessible :aboutus, :administrator, :alias, :birthday, :email, :forename, :activated, :surname, :password, :password_confirmation, :email_confirmation, :ournights, :contactus
  
	validates_presence_of :forename, :surname, :password, :password_confirmation, :email, :email_confirmation,  :on => :create
	validates_presence_of :forename, :surname, :on => :update
	#validates_presence_of :email_confirmation, :if => :administrator
	validates_uniqueness_of :email

	attr_accessor :password_confirmation
	attr_accessor :email_confirmation
	attr_accessor :administrator
	
	validates_confirmation_of  :forename, :surname, :password, :password_confirmation, :email, :email_confirmation, :activated, :on => :create
	validates_confirmation_of  :forename, :surname, :password, :password_confirmation, :on => :update
	
	def create_digest(message) 
		Digest::SHA2.hexdigest(message + self.password_salt)
	end
	
	def verify_id_digest(id_digest)
		id_digest == create_digest(self.id.to_s)
	end
end
