class ContactMailer < ActionMailer::Base
  default from: "foxandxss@foxandxss.net"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_form.subject
  #
  def contact_form(contact)
    @contact = contact

    mail to: @contact.email, subject: t("contact_form_subject")
  end
end
