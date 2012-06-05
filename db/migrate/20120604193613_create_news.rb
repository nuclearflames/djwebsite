class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :content
      t.integer :user_id, :null => false
      t.timestamps
    end
  end
end
