require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # Test that an invalid user wont get saved
  test "invalid user test" do
    user = User.new
    user.save
    refute user.valid?
  end

  # Test that a valid user will get saved correctly
  test "valid user test" do
    user = User.new
    user.email = "user@forum.com"
    user.password = "12345678"
    user.save
    assert user.valid?
  end

end
