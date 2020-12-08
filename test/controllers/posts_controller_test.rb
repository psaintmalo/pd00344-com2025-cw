require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @post2 = posts(:two)
    sign_in users(:one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post posts_url, params: { post: { text: @post.text, title: "My new original title", user_id: @post.user_id } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: { text: @post.text, title: @post.title, user_id: @post.user_id } }
    assert_redirected_to post_url(@post)
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end

  test "should redirect to login page if logged out" do
    sign_out users(:one)
    get posts_url
    assert_redirected_to new_user_session_url
  end

  test "should not destroy if logged out" do
    sign_out users(:one)
    delete post_url(@post)
    assert_redirected_to new_user_session_url
  end

  test "should not get edit from other users post" do
    get edit_post_url(@post2)
    assert_response :redirect
  end

  test "should not get destroy from other users post" do
    delete post_url(@post2)
    assert_redirected_to root_url
  end

end
