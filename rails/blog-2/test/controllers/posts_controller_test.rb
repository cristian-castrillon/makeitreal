require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  
  test "a customer can't create a post if it's not authenticated" do
    user = users(:cristian)
    post user_posts_path(user), params: { post: { content: 'Creando', title: 'Invalid Post' } }
    assert_redirected_to new_user_session_path
  end

  test "a customer can create a post if it's authenticated" do
    user = users(:cristian)
    sign_in user
    post user_posts_path(user), params: { post: { content: 'Creando', title: 'Valid Post' } }
    assert_redirected_to user_post_path(user, Post.last)
    follow_redirect!
    assert_select '.container .row h1', 'Valid Post'
  end

  test "a customer can modify his post" do
    user = users(:cristian)
    sign_in user
    post user_posts_path(user), params: { post: { content: 'Creando', title: 'Valid Post' } }
    # patch "/users/#{user.id}/posts/#{Post.last.id}", params: { post: { content: 'Editando', title: 'Valid Post Edited' } }
    patch user_post_path(user, Post.last), params: { post: { content: 'Editando', title: 'Valid Post Edited' } }
    @post = Post.last
    assert_redirected_to user_post_path(user, @post)
    follow_redirect!
    assert_select '.container .row h1', 'Valid Post Edited'
  end

  test "a user cannot update other user's post" do
    user = users(:cristian)
    sign_in user
    sim_post = posts(:chao_mundo)
    patch user_post_path(sim_post.user, sim_post), params: { post: { content: 'Editando', title: 'Valid Post Edited' } }
    assert_redirected_to user_post_path(sim_post.user, sim_post)
    follow_redirect!
    assert_select '.container .row h1', 'Valid Post Edited'
  end

  # test "a customer can create his comments" do
  #   user = users(:cristian)
  #   user.password = '1234567'
  #   sign_in user
  #   post user_posts_path(user), params: { post: { content: 'Creando', title: 'Valid Post' } }
  #   @post = Post.last
  #   post post_comments_path(@post), params: { comment: { content: 'Valid Comment' } }
  #   assert_redirected_to user_post_path(user, @post)
  #   follow_redirect!
  #   assert_select '.comments .panel .panel-body p', 'Valid Comment'
  # end
end
