require "application_system_test_case"

class CommentsPostsTest < ApplicationSystemTestCase
  setup do
    @comments_post = comments_posts(:one)
  end

  test "visiting the index" do
    visit comments_posts_url
    assert_selector "h1", text: "Comments posts"
  end

  test "should create comments post" do
    visit comments_posts_url
    click_on "New comments post"

    fill_in "Comment", with: @comments_post.comment_id
    fill_in "Post", with: @comments_post.post_id
    click_on "Create Comments post"

    assert_text "Comments post was successfully created"
    click_on "Back"
  end

  test "should update Comments post" do
    visit comments_post_url(@comments_post)
    click_on "Edit this comments post", match: :first

    fill_in "Comment", with: @comments_post.comment_id
    fill_in "Post", with: @comments_post.post_id
    click_on "Update Comments post"

    assert_text "Comments post was successfully updated"
    click_on "Back"
  end

  test "should destroy Comments post" do
    visit comments_post_url(@comments_post)
    click_on "Destroy this comments post", match: :first

    assert_text "Comments post was successfully destroyed"
  end
end
