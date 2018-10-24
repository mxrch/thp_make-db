class AddUserAndArticleToLike < ActiveRecord::Migration[5.2]
  def change
    add_reference :likes, :user
    add_reference :likes, :article
  end
end
