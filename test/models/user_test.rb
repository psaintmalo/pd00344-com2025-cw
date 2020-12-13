require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @user = users(:one)
  end

  # Test that an invalid user wont get saved
  test "shuold not create invalid user" do
    myUser = User.new
    myUser.save
    refute myUser.valid?
  end

  # Test that a valid user will get saved correctly
  test "should create valid user" do
    myUser = User.new
    myUser.username = "user"
    myUser.email = "user@forum.com"
    myUser.password = "12345678"
    myUser.save
    assert myUser.valid?
  end

  # Check that a user wont be able to register if its username isnt unique
  test "should not create user with non-unique username" do
    myUser = User.new
    myUser.username = "test"
    myUser.email = "abc@companyemail.com"
    myUser.password = "---"
    myUser.save
    refute myUser.valid?
  end

  # Check that a user wont be able to register if its email isnt unique
  test "should not create user with non-unique email" do
    myUser = User.new
    myUser.username = "abc"
    myUser.email = "test@forum.com"
    myUser.password = "---"
    myUser.save
    refute myUser.valid?
  end

  # Test that a user with no posts can be destroyed
  test "should destroy user with no posts" do

    myUser = User.new
    myUser.username = "abc"
    myUser.email = "abc@forum.com"
    myUser.password = "---"
    myUser.save

    myUser.destroy
    assert myUser.destroyed?

  end

  # Test that a user with posts can be destroyed
  test "should destroy user with posts" do

    @user.destroy
    assert @user.destroyed?

  end

end
