require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "a user can login successfuly" do
    user = users(:cristian)
    user.password = '1234567'
    user.save
    user_sign_in(user)
    assert_equal root_path, current_path
  end

  test "a looged in user can create a post" do
    user = users(:cristian)
    user.password = '1234567'
    user.save
    user_sign_in(user)
    visit new_user_post_path(user)
    fill_in 'post_title', with: 'Post de prueba'
    fill_in 'post_content', with: 'Este es un post de prueba'
    click_button 'Create Post'
    assert_selector 'h1', text: 'Post de prueba', count: 1
    assert_selector 'p', text: 'Este es un post de prueba', count: 1
  end
end
