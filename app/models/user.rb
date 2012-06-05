class User < ActiveRecord::Base
	acts_as_authentic do |config|
		config.crypto_provider = Authlogic::CryptoProviders::MD5
	end
	
	
  attr_accessible :aboutme, :administrator, :alias, :birthday, :email, :forename, :activated, :surname, :password, :password_confirmation, :email_confirmation
  
	validates_presence_of :forename, :surname, :password, :password_confirmation, :email, :email_confirmation,  :on => :create
	validates_presence_of :forename, :surname, :email,  :on => :update
	validates_uniqueness_of :email

	attr_accessor :password_confirmation
	attr_accessor :email_confirmation
	validates_confirmation_of  :forename, :surname, :password, :password_confirmation, :email, :email_confirmation, :activated, :on => :create
	validates_confirmation_of  :forename, :surname, :password, :password_confirmation, :on => :update

end
