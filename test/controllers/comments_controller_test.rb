require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
    @post = posts(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get post_comments_url(@post)
    assert_response :success
  end

  test "should get new" do
    get new_post_comment_url(@post, @comment)
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post post_comments_url(post_id: @post, id: @comment), params: { comment: { commentText: @comment.commentText, post_id: @comment.post_id, user_id: @comment.user_id } }

    end

    assert_redirected_to post_comment_url(@post, Comment.last)
  end

  test "should show comment" do
    get post_comment_url(@post, @comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_comment_url(@post, @comment)
    assert_response :success
  end

  test "should update comment" do
    patch post_comment_url(@post, @comment), params: { comment: { commentText: @comment.commentText, post_id: @comment.post_id, user_id: @comment.user_id } }
    assert_redirected_to post_comment_url(@comment)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete post_comment_url(@post, @comment)
    end

    assert_redirected_to  post_comments_url
  end
end
