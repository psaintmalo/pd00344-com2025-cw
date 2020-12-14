# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Generate the first users
adminUser = User.where(email: "admin@forum.com").first
adminUser.destroy if adminUser

supportUser = User.where(email: "support@forum.com").first
supportUser.destroy if supportUser

testUser = User.where(email: "testuser@forum.com").first
testUser.destroy if testUser

users = User.create([username: "admin", email: "admin@forum.com", password: "password"])
users = User.create([username: "support", email: "support@forum.com", password: "hardpassword"])
users = User.create([username: "testuser", email: "testuser@forum.com", password: "testpassword"])

supportUser = User.where(email: "support@forum.com").first
adminUser = User.where(email: "admin@forum.com").first
testUser = User.where(email: "testuser@forum.com").first

# Generate the first post
firstPost = Post.where(title: "Welcome to the forum").first
firstPost.destroy if firstPost

testPost = Post.where(title: "My First Post").first
testPost.destroy if testPost

testPost2 = Post.where(title: "My Second Post").first
testPost2.destroy if testPost2

posts = Post.create([title: "Welcome to the forum", text: "Hope you are able to enjoy using this forum", user_id: adminUser.id])
posts = Post.create([title: "My First Post", text: "Im very excited to try out this forum!", user_id: testUser.id])
posts = Post.create([title: "My Second Post", text: "I just had to make a second post!", user_id: testUser.id])

firstPost = Post.where(title: "Welcome to the forum").first
testPost = Post.where(title: "My First Post").first
testPost2 = Post.where(title: "My Second Post").first

#Generate the first comment
firstPostComment = Comment.where(commentText: "And remember, contact us if you need anything!", post_id: firstPost.id).first
firstPostComment.destroy(firstPost.id) if firstPostComment

firstPostComment2 = Comment.where(commentText: "Thanks, will do!", post_id: firstPost.id).first
firstPostComment2.destroy(firstPost.id) if firstPostComment2

testPostComment = Comment.where(commentText: "Im glad, I hope you are able to enjoy it!", post_id: testPost.id).first
testPostComment.destroy(testPost.id) if testPostComment

comments = Comment.create([commentText: "And remember, contact us if you need anything!", post_id: firstPost.id, user_id: supportUser.id])
comments = Comment.create([commentText: "Thanks, will do!", post_id: firstPost.id, user_id: testUser.id])
comments = Comment.create([commentText: "Im gald, I hope you are able to enjoy it!", post_id: testPost.id, user_id: adminUser.id])
