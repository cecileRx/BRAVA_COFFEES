class ProductsController < ApplicationController
  around_action :catch_not_found

  def index
    @products = Product.all
    @equipment_items = Product.joins(:category).where("categories.name = 'equipment'")
  end

  def show
    @product = Product.find(params[:id])
    @products = Product.all
    @equipment_items = Product.joins(:category).where("categories.name = 'equipment'")
    @needed_associated_products =  @equipment_items.select { |item| item.name =='chemex_3_name' || item.name == 'chemex_6_name' || item.name == 'hario_V60_ceramic_dripper_name' || item.name == 'hario_V60_glass_dripper_name'}
    @associated_products = @equipment_items.select { |item| item.name =='hario_01_name' || item.name == 'hario_02_name' || item.name == 'hario_skerton_grinder_name'}
    coffees_items = Product.joins(:category).where("categories.name = 'coffee'")
    @coffees = coffees_items.select { |coffee| coffee.weight == 250 }

  end

  def edit
     @Product = Product.find(params[:id])
  end

  def update
     @product = Product.find(params[:id])
     @product.update(product_params)
     redirect_to product_path(@product)
  end

  def coffee_product
    @coffees = Product.joins(:category).where("categories.name = 'coffee'")
    @product = Product.find(params[:id])
  end

  private

  def catch_not_found
    yield
  rescue ActiveRecord::RecordNotFound
    redirect_to root_url, :flash => { :error => "Record not found." }
  end

end
