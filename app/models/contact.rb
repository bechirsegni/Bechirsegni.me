class Contact < MailForm::Base
  attribute :subject,      :validate => true
  attribute :email
  attribute :message

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
        :subject => "My Contact Form",
        :to => "bechirsegni@gmail.com",
        :from => %(<#{email}>)
    }
  end
end