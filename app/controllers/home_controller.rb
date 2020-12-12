class HomeController < ApplicationController
  before_action :mail_params, only: [:request_contact]

  # Home page action
  def home
  end

  # Contact page action
  def contact
  end

  # Request Contact action to send an email
  def request_contact

    if mail_params[:email].blank?
      flash[:alert] = I18n.t("home.request_contact.no_email")
      redirect_to contact_url
    else
      ContactMailer.contact_email(mail_params)
      flash[:notice] = I18n.t("home.request_contact.email_sent")
      redirect_to root_url
    end



  end

  private

    # Strong parameters for emails
    def mail_params
      params.permit(:name, :reason, :message, :email)
    end

end
