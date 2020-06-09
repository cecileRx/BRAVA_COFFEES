class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @products = Product.all
    @coffees = Product.joins(:category).where("categories.name = 'coffee'")
  end
end
