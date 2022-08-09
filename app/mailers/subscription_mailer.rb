class SubscriptionMailer < ApplicationMailer
  def new_subscription_email
    @subscription = params[:subscription]
    @user = User.find_by(id: @subscription.user_id)
    attachments.inline["Brava_Logo_mail.png"] = File.read("#{Rails.root}/app/assets/images/Brava_Logo_mail.png")
    attachments.inline["facebook-square-brands.png"] = File.read("#{Rails.root}/app/assets/images/facebook-square-brands.png")
     attachments.inline["instagram-square-brands.png"] = File.read("#{Rails.root}/app/assets/images/instagram-square-brands.png")
    mail(to: "#{@user.email}", subject: t(".mail_subject"))
  end

  def admin_subscription_email
    @subscription = params[:subscription]
    @stripe_session_data = Stripe::Checkout::Session.retrieve("#{@subscription.checkout_session_id}")
    @user = User.find_by(id: @subscription.user_id)
    attachments.inline["Brava_Logo_mail.png"] = File.read("#{Rails.root}/app/assets/images/Brava_Logo_mail.png")
    attachments.inline["facebook-square-brands.png"] = File.read("#{Rails.root}/app/assets/images/facebook-square-brands.png")
     attachments.inline["instagram-square-brands.png"] = File.read("#{Rails.root}/app/assets/images/instagram-square-brands.png")
    mail(to: "bravacoffeeroasters@gmail.com", subject: "New Subscription")
  end
end
