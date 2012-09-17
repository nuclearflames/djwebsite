class AddMphoneHphoneOurnightsToUser < ActiveRecord::Migration
  def change
	add_column :users, :mphone, :string
	add_column :users, :hphone, :string
	add_column :users, :ournights, :string
	add_column :users, :contactus, :string
	rename_column :users, :aboutme, :aboutus
  end
end
