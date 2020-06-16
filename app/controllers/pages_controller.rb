class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :brewing ]

  def home
    @products = Product.all
    coffees_items = Product.joins(:category).where("categories.name = 'coffee'")
    @coffees = coffees_items.select { |coffee| coffee.weight == 250 }

  end

  def about
  end

  def brewing
  end

end
