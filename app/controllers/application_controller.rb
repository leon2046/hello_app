class ApplicationController < ActionController::Base
  include SessionsHelper

  protect_from_forgery with: :exception
  rescue_from SystemError, with: :system_error_handler

  before_action :logged_in_user, except: [:login, :authorize]

  def hello
    render html: "hello, world!"
  end


  private
    def system_error_handler(exception)
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
