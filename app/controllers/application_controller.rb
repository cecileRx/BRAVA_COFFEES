class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_order

  # def default_url_options
  #   { host: ENV["DOMAIN"] || "localhost:3000" }
  # end

  protected

  def set_order
    @current_order = current_user.orders.find_by(state: 'pending') if user_signed_in?
  end
end
