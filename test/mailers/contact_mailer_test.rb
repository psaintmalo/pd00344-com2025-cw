require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should return contact email" do
    mail = ContactMailer.contact_email("pd00344@surrey.ac.uk", "Pablo", "Account Support", @message = "Hello")

    assert_equal ["support@forum.com"], mail.to
    assert_equal ["support@forum.com"], mail.from
    
  end

end
