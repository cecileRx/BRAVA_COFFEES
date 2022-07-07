class Page < MailForm::Base
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Brava Contact Form - Manter contacto",
      :to => "bravacoffeeroasters@gmail.com",
      :from => %(<#{email}>)
    }
  end
end
