require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @post2 = posts(:two)
    sign_in users(:one)
  end

  test "should get index" do
    get posts_url

    assert_select "h1", "Posts"
    assert_select "a", "New Post"

    # Test table headers are correct
    assert_select "table" do
      assert_select "thead" do
        assert_select "tr" do
          assert_select "th", "Title"
          assert_select "th", "User"
          assert_select "th", "Created At"
        end
      end
    end

    # Test the correct number of options are being displayed
    assert_select "table" do
      assert_select "tbody" do
        assert_select "tr:nth-child(1)" do
          assert_select "a", "Edit"
          assert_select "a", {count: 3}
        end
        assert_select "tr:nth-child(2)" do
          assert_select "a", {count: 1}
        end
      end
    end

    assert_response :success
  end

  # Test no edit/destroy options are being displayed for others posts
  test "should not display edit/destroy on others posts" do

    get posts_url

    assert_select "table" do
      assert_select "tr:nth-child(3)" do
        assert_select "a", {count: 0, text: "Edit"}
        assert_select "a", {count: 0, text: "Destroy"}
      end
    end

  end

  # Test the new post page is being retrived properly
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

  test "should redirect to login page from posts if logged out" do
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
