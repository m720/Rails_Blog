class DeletePostsJob #< ApplicationJob
  #queue_as :default
  include Sidekiq::Worker

  def perform(id)
    # Do something later
    p "hello from delete posts"
    @post = Post.find(id)
    @post.destroy
    p "post destroyed"
  end
end
 