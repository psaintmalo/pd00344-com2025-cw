require 'test_helper'

class BookmarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bookmark = bookmarks(:one)
    sign_in users(:one)
  end

  # Test index is returned
  test "should get index" do
    get bookmarks_url
    assert_response :success
  end

  # Test you can create a bookmark
  test "should create bookmark" do
    assert_difference('Bookmark.count') do
      post bookmarks_url( params: { post_id: posts(:two).id, user_id: @bookmark.user_id })
    end

    assert_redirected_to bookmarks_url
  end

  # Test you can destroy your own bookmarks
  test "should destroy my bookmark" do
    assert_difference('Bookmark.count', -1) do
      delete bookmark_url(@bookmark)
    end

    assert_redirected_to bookmarks_url
  end

  # Test you cant destroy others bookmarks
  test "should not destroy others bookmark" do
    assert_difference('Bookmark.count', 0) do
      delete bookmark_url(bookmarks(:two))
    end
  end

  # Test the correct amount of bookmarks are being displayed
  test "should only display my bookmarks" do

    get bookmarks_url

    assert_select "tbody" do
      assert_select "tr", {count: 1}
    end
  end

  # Test empty index is displayed correctly
  test "should display empty index" do
    sign_out users(:one)
    sign_in users(:three)

    get bookmarks_url

    assert_select "h2", "This looks a bit empty, why not go to Posts and add some bookmarks?"
  end

end
