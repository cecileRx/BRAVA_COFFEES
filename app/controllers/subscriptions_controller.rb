class SubscriptionsController < ApplicationController

  before_action :authenticate_user!, except: [:new]

  def index
    @user = current_user

    if @user.admin?
      subscriptions = Subscription.all

      pending_subscriptions = []
      subscriptions.each do |item|
        if item.stripe_id != nil
          pending_subscriptions << item
        end
      end

      @subscriptions = []
      pending_subscriptions.each do |item|
        if Stripe::Checkout::Session.retrieve("#{item.stripe_id}").payment_status  == 'paid'
          @subscriptions << item
        end
      end

    else
      redirect_to root_url

    end
  end


  def new
    @subscription = Subscription.new
    coffee_items = Product.joins(:category).where("categories.name = 'coffee'")

    @coffee_choice = coffee_items.select { |coffee| coffee.weight == 250 }

  end

  def create
    @subscription = Subscription.new

    @user = current_user

    if params[:name] == 'Discovery' && params[:weight] == '250'
      @subscription.price_id = 'price_1HxtBpJoAorz6CW7akEOvvjd'
    elsif params[:name] == 'Discovery' && params[:weight] == '1000'
      # @subscription.price_id = 'price_1HuCWZJoAorz6CW7MefdKVA5'
      @subscription.price_id = 'price_1HxtBpJoAorz6CW7aQiQywTa'
    elsif params[:name] == 'Adventure' && params[:weight] == '250'
      @subscription.price_id = 'price_1HxtBGJoAorz6CW7HHc868Fh'
    else
      @subscription.price_id = 'price_1HxtBGJoAorz6CW7poQ8akoe'
    end

    @subscription.item_choice = params[:coffees]
    @subscription.grind= params[:grind]
    @subscription.name= params[:name]
    @subscription.current_period_start = DateTime.now
    @subscription.current_period_end = DateTime.now + 2.months
    @subscription.user_id = @user.id
    @subscription.save

    redirect_to subscription_path(@subscription)
  end

  def show
    @subscription = Subscription.find(params[:id])
    @user = current_user


    line_items_subscription = {
      name: @subscription.item_choice,
      description: @subscription.grind,
      price: @subscription.price_id,
      quantity: 1
    }

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      shipping_address_collection: {
        allowed_countries: ['GB', 'BE', 'CZ', 'FR', 'DK', 'DE', 'EE', 'IE', 'HR', 'IT', 'CY', 'LV', 'LT', 'LU', 'HU', 'MT', 'NL', 'AT', 'PL', 'RO', 'SI', 'SK', 'FI', 'SE', 'IS', 'LI', 'NO', 'CH', 'PT', 'ES', 'ME', 'MK', 'AL', 'RS', 'TR', 'DZ', 'MA', 'IL']
      },
      mode: 'subscription',
      line_items: [{
        quantity: 1,
        price: @subscription.price_id,
        }],
      customer_email: current_user.email,
      success_url: subscription_messages_url(@subscription),
      cancel_url: root_url
    )

    customer = Stripe::Customer.create({
      email: current_user.email,
      name: current_user.username,
      metadata: {

      },
    })

     @user.stripe_id = customer.id
     @user.save
     @subscription.stripe_id = @session.id
     @subscription.save
  end

  def messages
    @subscription = Subscription.find(params[:subscription_id])


  end


end
