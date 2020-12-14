require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
    @post = posts(:one)
    sign_in users(:one)
  end

  # Test comments index is returned correctly for a non-empty index
  test "should get non-empty index" do
    get post_comments_url(@post)

    assert_select "h1", "Post: " << @post.title
    assert_select "h2", "All Comments"

    assert_select "div[class=comment]", {count: @post.comments.count}



  end

  # Should return the appropiate empty index
  test "should get empty index" do
    get post_comments_url(posts(:three))

    assert_select "h3", "Oh no, this is a bit empty, why not be the first one to make a comment?"
    assert_select "table", false

  end

  # Test the correct new comment page is returned
  test "should get new" do
    get new_post_comment_url(@post, @comment)
    assert_response :success

    assert_select "h1", "New Comment"
    assert_select "label", "Comment"
  end

  # Test a comment is created correctly
  test "should create comment" do
    assert_difference('Comment.count') do
      post post_comments_url(post_id: @post, id: @comment), params: { comment: { commentText: @comment.commentText, post_id: @comment.post_id} }

    end

    assert_redirected_to @post
  end

  # Should be able to destroy your own comment
  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete post_comment_url(@post, @comment)
    end

    assert_redirected_to  post_comments_url
  end

  # Shouldnt be able to destroy others comments
  test "should not destroy comment if from another user" do

    assert_difference('Comment.count', 0) do
      delete post_comment_url(@post, comments(:two))
    end

    assert_redirected_to  post_comments_url
  end

  # Test redirect to login page if logged out
  test "should redirect to login page from comments if logged out" do
    sign_out users(:one)
    get post_comments_url(@post)
    assert_redirected_to new_user_session_url
  end

  # Test if you are able to create an empty comment
  test "should not create empty comments" do
    comment = Comment.new
    refute comment.valid?
  end
end
