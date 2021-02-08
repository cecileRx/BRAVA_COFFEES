class OrderMailer < ApplicationMailer
  def new_order_email
    # @order = Order.find(params[:order_id])
    @order = params[:order]
    @user = User.find_by(id: @order.user_id)

    mail(to: "#{@user.email}", subject: t(".mail_subject"))
  end
end
