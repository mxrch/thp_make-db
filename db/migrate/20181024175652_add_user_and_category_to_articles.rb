class AddUserAndCategoryToArticles < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :user
    add_reference :articles, :category
  end
end
