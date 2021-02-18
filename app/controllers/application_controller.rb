class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  around_action :switch_locale

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action  :current_cart


  after_action :store_action


  def switch_locale(&action)
  locale = params[:locale] || I18n.default_locale
  I18n.with_locale(locale, &action)
  end


  # def set_locale
  #   I18n.locale = params.fetch(:locale, I18n.default_locale).to_sym
  # end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end


  # def current_user
  #   if session[:user_id]
  #     @user = User.find(session[:user_id])
  #   end
  # end




  def current_cart

        if session[:cart_id]
          cart = Cart.find_by_id(session[:cart_id])
          if cart == nil
            session[:cart_id] = nil
          end

          if cart.present?
            @current_cart = cart
          else
            session[:cart_id] = nil
          end
        end


        if session[:cart_id] == nil
          @current_cart = Cart.create
          session[:cart_id] = @current_cart.id
        end


  end


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

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end



end
