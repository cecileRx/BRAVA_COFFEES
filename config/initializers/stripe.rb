if Rails.env.production?
Rails.configuration.stripe = {
  publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  secret_key:      ENV['STRIPE_SECRET_KEY'],
  signing_secret:  ENV['STRIPE_WEBHOOK_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_TEST_KEY'],
    secret_key:      ENV['STRIPE_SECRET_TEST_KEY']
  }
end

  Stripe.api_key = Rails.configuration.stripe[:secret_key]
  StripeEvent.signing_secret = Rails.configuration.stripe[:signing_secret]

