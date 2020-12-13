require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @post = posts(:one)
    @user = users(:one)
  end

  # Test that two posts with the same title cant be created
  test "should not save post with non unique title" do

    myPost = Post.new
    myPost.title = "Title"
    myPost.text = "Nothing"
    myPost.user = @user
    myPost.save
    assert myPost.valid?

    myPost2 = Post.new
    myPost2.title = "Title"
    myPost2.text = "Something else"
    myPost2.user = @user
    myPost2.save
    refute myPost2.valid?

  end

  # Test that a post can be created with all attributes
  test "should create post" do

    myPost = Post.new
    myPost.title = "Title"
    myPost.text = "Nothing"
    myPost.user = @user
    myPost.save
    assert myPost.valid?

  end

  # Test that a post cant be created with no user
  test "should not create post with no user" do

    myPost = Post.new
    myPost.title = "Title"
    myPost.text = "Nothing"

    myPost.save
    refute myPost.valid?

  end

  # Test that a post cant be created with no title
  test "should not create post with no title" do

    myPost = Post.new
    myPost.text = "Nothing"
    myPost.user = @user

    myPost.save
    refute myPost.valid?

  end

  # Test that a post can be created with no text
  test "should create post with no text" do

    myPost = Post.new
    myPost.title = "Title"
    myPost.user = @user

    myPost.save
    assert myPost.valid?

  end

  # Test that a post can be destroyed
  test "should destroy post" do

    @post.destroy
    assert @post.destroyed?
  end


end
