class PagesController < ApplicationController


  def home
    @contact = Page.new(params[:page])
    @products = Product.all
    coffees_items = Product.joins(:category).where("categories.name = 'coffee'")
    @coffees = coffees_items.select { |coffee| coffee.weight == 250 }
    @cart = @current_cart
    total = []
    @cart.order_items.each do |item|

      total << item.product.price_cents * item.quantity.to_i
    end

    @cart.amount_cents_cents = total.sum

  end

  def new
    @contact = Page.new(params[:page])
  end


    def create
    @contact = Page.new(params[:page])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        # re-initialize Pages object for cleared form
        @contact = Page.new
        format.html { render 'home' }
        format.js   { flash[:notice] = "Thank you for your message. We'll get back to you soon!" }
      else
        format.html { render 'home' }
        format.js   { flash[:notice] = "Oups! Something went wrong!." }
      end
    end
  end

  def about
  end

  def brewing
  end

end
