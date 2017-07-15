require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  test "a user can create a comment in a post and load the comment" do
    post = posts(:hola_mundo)
    visit post_path(post)
    fill_in 'comment_content', with: 'Awesome Post'
    click_button 'Comentar'
    assert_selector '.comments .panel .panel-body p', text: 'Awesome Post', count: 1
  end
end
