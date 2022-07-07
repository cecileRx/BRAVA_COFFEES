# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :port           => 587,
  :address        => 'smtp.eu.mailgun.org',
  :user_name      => ENV['MAILGUN_SMTP_LOGIN'],
  :password       => ENV['MAILGUN_SMTP_PASSWORD'],
  :domain         => 'mg.bravacoffeeroasters.com',
  :authentication => :plain,
}
ActionMailer::Base.delivery_method = :smtp

