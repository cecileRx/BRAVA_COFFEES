class OrderMailer < ApplicationMailer
  def new_order_email
    # @order = Order.find(params[:order_id])

    @order = params[:order]
    @user = User.find_by(id: @order.user_id)
    attachments.inline["Brava_Logo_mail.png"] = File.read("#{Rails.root}/app/assets/images/Brava_Logo_mail.png")
    attachments.inline["facebook-square-brands.png"] = File.read("#{Rails.root}/app/assets/images/facebook-square-brands.png")
     attachments.inline["instagram-square-brands.png"] = File.read("#{Rails.root}/app/assets/images/instagram-square-brands.png")
    mail(to: "#{@user.email}", subject: t(".mail_subject"))
  end
end
