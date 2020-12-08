require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
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

  test "should save post with unique title" do

    myPost = Post.new
    myPost.title = "Title"
    myPost.text = "Nothing"
    myPost.user = @user
    myPost.save
    assert myPost.valid?

    myPost2 = Post.new
    myPost2.title = "Title2"
    myPost2.text = "Something else"
    myPost2.user = @user
    myPost2.save
    assert myPost2.valid?

  end


end
