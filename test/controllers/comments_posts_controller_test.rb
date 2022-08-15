require "test_helper"

class CommentsPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comments_post = comments_posts(:one)
  end

  test "should get index" do
    get comments_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_comments_post_url
    assert_response :success
  end

  test "should create comments_post" do
    assert_difference("CommentsPost.count") do
      post comments_posts_url, params: { comments_post: { comment_id: @comments_post.comment_id, post_id: @comments_post.post_id } }
    end

    assert_redirected_to comments_post_url(CommentsPost.last)
  end

  test "should show comments_post" do
    get comments_post_url(@comments_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_comments_post_url(@comments_post)
    assert_response :success
  end

  test "should update comments_post" do
    patch comments_post_url(@comments_post), params: { comments_post: { comment_id: @comments_post.comment_id, post_id: @comments_post.post_id } }
    assert_redirected_to comments_post_url(@comments_post)
  end

  test "should destroy comments_post" do
    assert_difference("CommentsPost.count", -1) do
      delete comments_post_url(@comments_post)
    end

    assert_redirected_to comments_posts_url
  end
end
