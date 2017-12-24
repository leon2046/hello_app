class SessionsController < ApplicationController
  def login
  end

  def authorize
    user = User.find_by(account: params[:session][:account].downcase)
    if user #&& user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in user
      redirect_to new_good_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'login'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
