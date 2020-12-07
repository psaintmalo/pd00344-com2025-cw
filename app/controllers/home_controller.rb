class HomeController < ApplicationController

  # Home page action
  def home
  end

  # Contact page action
  def contact
  end


  def request_contact

    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]

    if email.blank?
      flash[:alert] = I18n.t("home.request_contact.no_email")
      redirect_to contact_url
    else
      ContactMailer.contact_email(email, name, telephone, message)
      flash[:notice] = I18n.t("home.request_contact.email_sent")
      redirect_to root_url
    end



  end

end
