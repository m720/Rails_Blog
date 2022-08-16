# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


user1 = User.create(name: 'user1', email: 'user1@users.com', password: "12345mA$", image: 'gjnafghas');
user2 = User.create(name: 'user2', email: 'user2@users.com', password: "12345mA$", image: 'gjnafghas');

post1 = Post.create(title: 'post1', body: 'this is post1', user_id: '1');

comment1 = Comment.create(title: 'comment1', body: 'this is comment1', user_id: '2');

comment_post = CommentsPost.create(comment_id: '1', post_id: '1');

tag1 = Tag.create(title: 'tag1');

tag_post = TagsPost.create(post_id: '1', tag_id: '1');