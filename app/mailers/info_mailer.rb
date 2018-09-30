class InfoMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.info_mailer.form_contact.subject
  #
  def form_contact(contacto)
    @correo = Contact.find(contacto.id)
    #raise @correo.to_json
    @greeting = "Hi #{contacto.email}"

    mail(to: "subgerenciameprecomcm@gmail.com", subject: @greeting)
  end
end
