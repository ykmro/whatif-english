class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email].downcase)
    if user && user.authenticate(session_params[:password])
      log_in user
      flash[:notice] = "ログインしました。"
      user.last_login_date
      redirect_to "/"
    else
      flash[:danger] = "メールアドレスまたはパスワードの組み合わせが正しくありません。"
      redirect_to "/login"
    end
  end

  def destroy
    log_out
    flash[:notice] = "ログアウトしました。"
    redirect_to "/"
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
