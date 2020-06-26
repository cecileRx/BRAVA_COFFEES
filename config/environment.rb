# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => ENV["MG_EMAIL"],
  :password => ENV["MG_PASSWORD"],
  :domain => 'protected-escarpment-80325.herokuapp.com',
  :address => 'smtp.mailgun.org',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
