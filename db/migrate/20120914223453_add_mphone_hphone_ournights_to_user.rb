class AddMphoneHphoneOurnightsToUser < ActiveRecord::Migration
  def change
    add_column :users, :Mphone, :string
    add_column :users, :Hphone, :string
    add_column :users, :Ournights, :string
  end
end
