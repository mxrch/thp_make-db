require 'faker'

#WE REMOVE ALL
ActiveRecord::Base.connection.execute("DELETE FROM SQLITE_SEQUENCE")
User.delete_all
Category.delete_all
Article.delete_all
Like.delete_all
Comment.delete_all

#CREATE USER
10.times do
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.free_email)
end

#CATEGORY
5.times do
  category = Category.create!(name: Faker::Book.unique.genre)
end

#ARTICLE WITHOUT LIKES
10.times do
  article = Article.create!(title: Faker::Book.title, content: Faker::Lorem.paragraph, like: 0, user_id: rand(1..User.count), category_id: rand(1..Category.count))
end

#COMMENTS
15.times do
  comment = Comment.create!(content: Faker::Lorem.question, user_id: rand(1..User.count), article_id: rand(1..Article.count))
end

#ADD LIKES TO ARTICLES
15.times do
  rand_article = rand(1..Article.count)
  like = Like.create!(user_id: rand(1..User.count), article_id: rand_article)
  article = Article.find(rand_article)
  article.like += 1
  article.save
end
