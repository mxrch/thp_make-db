class Cafaitchierla < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :categories_id
  end
end
