# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :port           => 587,,
  :address        => 'smtp.mailgun.org',
  :user_name      => ENV['MAILGUN_SMTP_LOGIN'],
  :password       => ENV['MAILGUN_SMTP_PASSWORD'],
  :domain         => 'protected-escarpment-80325.herokuapp.com',
  :authentication => :plain,
}
ActionMailer::Base.delivery_method = :smtp

