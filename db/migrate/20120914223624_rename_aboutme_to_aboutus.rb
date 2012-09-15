class RenameAboutmeToAboutus < ActiveRecord::Migration
  def up
	rename_column :users, :aboutme, :aboutus
  end

  def down
	rename_column :users, :aboutus, :aboutme
  end
end
