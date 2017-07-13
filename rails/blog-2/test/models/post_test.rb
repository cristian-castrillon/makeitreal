require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = posts(:hola_mundo)
  end
  test "it should create a post with title and content" do
    user = users(:simon)
    post = Post.new(title: 'hola', content: 'My content', user: user)
    assert post.save
  end

  test "it should validate content should be less than 140 chars" do
    @post.content = 'k' * 141
    @post.validate
    assert_includes(@post.errors[:content], 'is too long (maximum is 140 characters)')
  end

  test "it should validate content should be greater than 0 chars" do
    @post.content = ''
    @post.validate
    assert_includes(@post.errors[:content], 'is too short (minimum is 1 character)')
  end

  test "it should validate content must exists" do
    @post.content = nil
    @post.validate
    assert_includes(@post.errors[:content], "can't be blank")
  end

  test "it should validate title should be less than 100 chars" do
    @post.title = 'k' * 101
    @post.validate
    assert_includes(@post.errors[:title], 'is too long (maximum is 100 characters)')
  end

  test "it should validate title should be greater than 0 chars" do
    @post.title = ''
    @post.validate
    assert_includes(@post.errors[:title], 'is too short (minimum is 1 character)')
  end

  test "it should validate title must exists" do
    @post.title = nil
    @post.validate
    assert_includes(@post.errors[:title], "can't be blank")
  end

  test "post should be valid" do
    assert @post.valid?
  end
end
