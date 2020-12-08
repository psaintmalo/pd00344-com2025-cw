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
    myUser.email = "user@forum.com"
    myUser.password = "12345678"
    myUser.save
    assert myUser.valid?
  end

  # Test that a user with no posts can be destroyed
  test "should destroy user with no posts" do

    @user.destroy
    assert @user.destroyed?

  end

  # Test that a user with posts can be destroyed
  test "should destroy user with posts" do

    post = Post.new
    post.title = "This is my first post"
    post.text = "Im very excited!"
    post.user = @user
    post.save

    assert post.valid?

    @user.destroy
    assert @user.destroyed?

  end


end
