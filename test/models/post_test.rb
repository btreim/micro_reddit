require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.new(user_id:1, body:"foo")
  end

  test "user_id should be present" do
    @post.user_id = "  "
    assert_not @post.valid?
  end

  test "body should be present" do
    @post.body = nil
    assert_not @post.valid?
  end

  test "body should be no longer than 160 characters" do
  @post.body = "a"*161
  assert_not @post.valid?	 
  end
end
