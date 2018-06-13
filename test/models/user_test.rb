require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name:"test")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "name should not be blank" do 
  	@user.name = "   "
  	assert_not @user.valid?
  end

  test "name should not exceed 50 characters" do 
  	@user.name = "a" * 55
  	assert_not @user.valid?
  end

  test "name should be unique" do 
  	dup_user = @user.dup
  	dup_user.name = @user.name.upcase
  	@user.save
  	assert_not dup_user.valid?
  end

end
