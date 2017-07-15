require "application_system_test_case"

class CreateCommentsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit create_comments_url
  #
  #   assert_selector "h1", text: "CreateComment"
  # end
  test "a user can create a comment" do
    simon = users(:simon)
    post = simon.posts.first
    # visit new_post_comment_path(post)
    visit post_path(post)
    fill_in 'comment_content', with: 'Awesome Post'
    click_button 'Comentar'
    # assert_redirect_to post_path(post)
    assert_equal post_path(post), current_path
    # assert_selector '.comments .panel .panel-body p', 'Awesome Post'
    assert_selector '.comments .panel .panel-body p', text: 'Awesome Post', count: 1
  end
end
