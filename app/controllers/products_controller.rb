class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def coffee_product
    @coffees = Product.joins(:category).where("categories.name = 'coffee'")
    @product = Product.find(params[:id])
  end
end
