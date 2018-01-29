class SessionsController < ApplicationController
  def login
    log_out
  end

  def authorize
    user = User.find_by(account: member_params[:account].downcase)
    if user && user.authenticate(member_params[:password])
      log_in user
      redirect_to orders_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :login
    end
  end

  def destroy
    log_out
    redirect_to :login
  end

  private
    def member_params
      params.require(:session).permit(:account, :password)
    end
end
