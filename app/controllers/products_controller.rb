class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = Product.all
    @equipment_items = Product.joins(:category).where("categories.name = 'equipment'")
  end

  def show
    @product = Product.find(params[:id])
    @products = Product.all
    @equipment_items = Product.joins(:category).where("categories.name = 'equipment'")
    coffees_items = Product.joins(:category).where("categories.name = 'coffee'")
    @coffees = coffees_items.select { |coffee| coffee.weight == 250 }
  end

  def coffee_product
    @coffees = Product.joins(:category).where("categories.name = 'coffee'")
    @product = Product.find(params[:id])
  end


end
