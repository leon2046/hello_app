class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :logged_in_user, except: [:new, :create]

  def hello
    render html: "hello, world!"
  end


  private
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
