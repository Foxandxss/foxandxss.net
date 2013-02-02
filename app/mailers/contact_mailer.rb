class ContactMailer < ActionMailer::Base
  default from: Settings.mailer_sender

  def contact_form(contact)
    @contact = contact

    mail to: @contact.email, subject: t("contact_form_subject")
  end
end
