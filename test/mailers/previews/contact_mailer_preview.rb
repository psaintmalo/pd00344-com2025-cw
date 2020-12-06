# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  def contact_email
    ContactMailer.contact_email("pd00344@surrey.ac.uk", "Pablo", "123456789", @message = "Hello")
  end

end
