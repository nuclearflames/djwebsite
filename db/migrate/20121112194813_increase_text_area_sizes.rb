class IncreaseTextAreaSizes < ActiveRecord::Migration
  def up
	change_column :users, :aboutus, :text
	change_column :users, :contactus, :text
	change_column :users, :ournights, :text
  end

  def down
  end
end
