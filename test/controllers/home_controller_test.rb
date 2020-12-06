require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_select "h1", "Welcome to the module selector"
    assert_select "p", "Here you will be able to choose your optional modules"
  end

  test "should get contact" do
    get contact_url
    assert_response :success
  end

  test "correct post response but no email sent" do
    post request_contact_url

    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  test "correct post response and email sent" do
    post request_contact_url, params: {name: "Pablo", email: "pd00344@surrey.ac.uk",
    telephone: "123456789", message: "This is a test"}

    assert_response :redirect
    assert_nil flash[:alert]
    assert_not_empty flash[:notice]
  end

end
