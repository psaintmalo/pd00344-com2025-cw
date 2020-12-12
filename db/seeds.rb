# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Generate the first user
firstUser = User.where(email: "admin@forum.com").first
firstUser.destroy if firstUser

supportUser = User.where(email: "support@forum.com").first
supportUser.destroy if supportUser

users = User.create([username: "admin", email: "admin@forum.com", password: "password"])
users = User.create([username: "support", email: "support@forum.com", password: "hardpassword"])

supportUser = User.where(email: "support@forum.com").first
firstUser = User.where(email: "admin@forum.com").first

# Generate the first post
firstPost = Post.where(title: "Welcome to the forum").first
firstPost.destroy if firstPost

posts = Post.create([title: "Welcome to the forum", text: "Hope you are able to enjoy using this forum", user_id: firstUser.id])

firstPost = Post.where(title: "Welcome to the forum").first

#Generate the first comment
firstComment = Comment.where(commentText: "And remember, contact us if you need anything!", post: firstPost.id).first
firstComment.destroy(firstPost.id) if firstComment

comments = Comment.create([commentText: "And remember, contact us if you need anything!", post: firstPost, user: supportUser])
