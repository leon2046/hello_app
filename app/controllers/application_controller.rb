class ApplicationController < ActionController::Base
  include SessionsHelper

  protect_from_forgery with: :exception

  rescue_from SystemError, with: :error_handler
  unless Rails.env.development?
    rescue_from ActionController::RoutingError,   with: :error_handler
  end

  before_action :logged_in_user, except: [:login, :authorize]

  def hello
    render html: "hello, world!"
  end

  def check_owner_user_id(record)
    raise SystemError if (record.nil? ||
      (record.has_attribute?(:owner_user_id) && record.owner_user_id != @current_user.id))
    return record
  end

  def attach_owner_user_id(params = nil)
    owner_user_hash = {:owner_user_id => @current_user.id}.merge(params || {})
  end

  def check_order_id
    raise SystemError if Order.where(attach_owner_user_id({:id => params[:order_id]})).empty?
  end

  def check_customer_id
    raise SystemError if Customer.where(attach_owner_user_id({:id => params[:customer_id]})).empty?
  end

  private
    def error_handler(exception)
      render 'errors/system_error'
    end

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # beforeアクション
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
