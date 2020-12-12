require 'test_helper'

class BookmarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bookmark = bookmarks(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get bookmarks_url
    assert_response :success
  end

  test "should create bookmark" do
    assert_difference('Bookmark.count') do
      post bookmarks_url( params: { post_id: posts(:two).id, user_id: @bookmark.user_id })
    end

    assert_redirected_to bookmarks_url
  end

  test "should destroy my bookmark" do
    assert_difference('Bookmark.count', -1) do
      delete bookmark_url(@bookmark)
    end

    assert_redirected_to bookmarks_url
  end

  test "should not destroy others bookmark" do
    assert_difference('Bookmark.count', 0) do
      delete bookmark_url(bookmarks(:two))
    end
  end

  test "should only display my bookmarks" do

    get bookmarks_url

    assert_select "tbody" do
      assert_select "tr", {count: 1}
    end
  end

end
