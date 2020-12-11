require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

  #Tests if the home page is returned correctly
  test "should get home" do
    get root_url
    assert_select "h1", "Welcome to the forum"
    assert_select "p", "Here you will be able to share your ideas and read others."
  end

  test "get logged out msg when logged out" do
    get root_url
    assert_select "h3", "To be able to use the forum please log in to you account or sign up."
  end

  # Check if the contact page is returned correctly
  test "should get contact" do
    get contact_url
    assert_select "h1", "Contact Us"
    assert_select "p", "Fill the form bellow to contact us"
  end

  # Check an empty email form will return an alert and no notice
  test "correct post response but no email sent" do
    post request_contact_url

    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  # Check a valid email will return a notice and no alert
  test "correct post response and email sent" do
    post request_contact_url, params: {name: "Pablo", email: "pd00344@surrey.ac.uk",
    telephone: "123456789", message: "This is a test"}

    assert_response :redirect
    assert_nil flash[:alert]
    assert_not_empty flash[:notice]
  end

end
