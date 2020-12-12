class ContactMailer < ApplicationMailer

  def contact_email(email, name,  reason, message)

    @email = email
    @name = name
    @reason = reason
    @message = message

    mail cc: @mail

  end

end
