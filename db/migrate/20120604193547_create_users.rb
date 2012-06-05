class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
	#details
	t.string :forename, :null => false
	t.string :surname, :null => false
	t.boolean :administrator, :default => false
	t.boolean :activated, :default => false
	t.string :alias
	t.string :aboutme
	t.string :birthday, :null => false
	#authlogic	
	t.string :email, :null => false
	t.string :persistence_token, :null => false
	t.string :crypted_password, :null => false
	t.string :password_salt, :null => false
	t.string :single_access_token, :null => false
	t.string :perishable_token, :null => false
	t.integer :login_count, :default => 0
	t.integer :failed_login_count, :default => 0
	t.datetime :last_request_at
	t.datetime :current_login_at
	t.datetime :last_login_at
	t.string :current_login_ip
	t.string :last_login_ip
      t.timestamps
    end
  end
end
