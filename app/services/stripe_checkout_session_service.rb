class StripeCheckoutSessionService
  def call(event)
    session = Stripe::Checkout::Session.retrieve("#{event.data.object.id}")
    if session.mode  == 'subscription'
      subscription = Subscription.find_by(checkout_session_id: event.data.object.id)
      subscription.update(active: true)
      sub_id = session.subscription
      subscription.update(stripe_subscription_id: "#{sub_id}")

      Stripe::SubscriptionSchedule.create({
        customer: session.customer,
        start_date: 'now',
        end_behavior: 'cancel',
        phases: [
          {
            items: [
              {
                price: subscription.price_id,
                quantity: 1,
              },
            ],
            iterations: 2,
          },
        ],
      })

    else
      order = Order.find_by(checkout_session_id: event.data.object.id)
     order.update(state: 'paid')
    end

   end

end
