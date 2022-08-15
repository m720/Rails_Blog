require "application_system_test_case"

class TagsPostsTest < ApplicationSystemTestCase
  setup do
    @tags_post = tags_posts(:one)
  end

  test "visiting the index" do
    visit tags_posts_url
    assert_selector "h1", text: "Tags posts"
  end

  test "should create tags post" do
    visit tags_posts_url
    click_on "New tags post"

    fill_in "Post", with: @tags_post.post_id
    fill_in "Tag", with: @tags_post.tag_id
    click_on "Create Tags post"

    assert_text "Tags post was successfully created"
    click_on "Back"
  end

  test "should update Tags post" do
    visit tags_post_url(@tags_post)
    click_on "Edit this tags post", match: :first

    fill_in "Post", with: @tags_post.post_id
    fill_in "Tag", with: @tags_post.tag_id
    click_on "Update Tags post"

    assert_text "Tags post was successfully updated"
    click_on "Back"
  end

  test "should destroy Tags post" do
    visit tags_post_url(@tags_post)
    click_on "Destroy this tags post", match: :first

    assert_text "Tags post was successfully destroyed"
  end
end
