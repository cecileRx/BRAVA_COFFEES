class SubscriptionsController < ApplicationController

  before_action :authenticate_user!, except: [:new]

  def index
    @user = current_user

    if @user.admin?
      @subscriptions = Subscription.all
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
    @subscription.current_period_end = DateTime.now + 3.months
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
        allowed_countries: ['US', 'CA', 'FR', 'PT', 'ES']
      },
      mode: 'subscription',
      line_items: [{
        quantity: 1,
        price: @subscription.price_id,
        }],
      customer_email: current_user.email,
      success_url: root_url,
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
  end


end
