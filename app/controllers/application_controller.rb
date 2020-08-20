class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_order
  after_action :store_action

  # def default_url_options
  #   { host: ENV["DOMAIN"] || "localhost:3000" }
  # end
 def store_action
    return unless request.get?
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      store_location_for(:user, request.fullpath)
    end
  end

  protected

  def set_order
    @current_order = current_user.orders.find_by(state: 'pending') if user_signed_in?
  end
end
