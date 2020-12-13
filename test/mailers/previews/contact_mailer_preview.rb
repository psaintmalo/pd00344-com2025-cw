# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  def preview_contact_email1
    ContactMailer.contact_email("pd00344@surrey.ac.uk", "Pablo de Saint-Malo", "Account Problems", @message = "Hi, I have been habing trouble logging in to my account ")
  end

  def preview_contact_email2
    ContactMailer.contact_email("me@email.com", "Joseph", "Other Problems", @message = "How does this website work?")
  end

end
