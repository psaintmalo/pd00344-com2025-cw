require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @comment = comments(:one)
    @user = users(:one)
    @post = posts(:one)
  end

  # Test a comment can be created
  test "should create comment" do

    comment = Comment.new
    comment.commentText = "Test"
    comment.post = @post
    comment.user = @user

    comment.save
    assert comment.valid?

  end

  # Test a comment cant be created with no arguments
  test "should not create empty comment" do
    comment = Comment.new

    comment.save
    refute comment.valid?
  end

  # Test a comment cant be created without user
  test "should not create comment without user" do

    comment = Comment.new
    comment.commentText = "Test"
    comment.post = @post

    comment.save
    refute comment.valid?

  end

  # Test a comment cant be created without post
  test "should not create comment without post" do

    comment = Comment.new
    comment.commentText = "Test"
    comment.user = @user

    comment.save
    refute comment.valid?

  end

  # Test a comment cant be created without text
  test "should not create comment without text" do

    comment = Comment.new
    comment.post = @post
    comment.user = @user

    comment.save
    refute comment.valid?

  end

  # Test a comment can be destroyed
  test "should destroy comment" do

    @comment.destroy
    assert @comment.destroyed?

  end

  # Test that duplicate comments can be created
  test "should create duplicate commend" do
    comment = Comment.new
    comment.commentText = "Test"
    comment.post = @post
    comment.user = @user

    comment.save
    assert comment.valid?

    comment2 = Comment.new
    comment2.commentText = "Test"
    comment2.post = @post
    comment2.user = @user

    comment2.save
    assert comment2.valid?
  end

end
