# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  def contact_email
    ContactMailer.contact_email("pd00344@surrey.ac.uk", "Pablo de Saint-Malo", "Account Problems", @message = "Hi, I have been habing trouble logging in to my account ")
  end

end
