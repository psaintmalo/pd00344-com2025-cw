require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_select "h1", "Welcome to the module selector"
    assert_select "p", "Here you will be able to choose your optional modules"
  end

end
