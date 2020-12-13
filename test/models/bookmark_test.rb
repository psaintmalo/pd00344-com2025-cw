require 'test_helper'

class BookmarkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @bookmark = bookmarks(:one)
    @post = posts(:one)
    @user = users(:one)
  end

  # Test a bookmark can be created
  test "should create bookmark" do
    bookmark = Bookmark.new
    bookmark.post = @post
    bookmark.user = @user

    bookmark.save
    assert bookmark.valid?
  end

  # Test an empty bookmark cant be created
  test "should not create bookmark" do
    bookmark = Bookmark.new

    bookmark.save
    refute bookmark.valid?
  end

  # Test a bookmark without post cant be created
  test "should not create bookmark with no post" do
    bookmark = Bookmark.new
    bookmark.user = @user

    bookmark.save
    refute bookmark.valid?
  end

  # Test a bookmark without user cant be created
  test "should not create bookmark with no user" do
    bookmark = Bookmark.new
    bookmark.post = @post

    bookmark.save
    refute bookmark.valid?
  end


  # Test a bookmark can be destroyed
  test "should destroy bookmark" do
    @bookmark.destroy
    assert @bookmark.destroyed?
  end

end
