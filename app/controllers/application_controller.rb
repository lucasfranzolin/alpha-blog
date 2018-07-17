class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def current_user
    # se ja procurou pelo user, usa o mesmo, senao pesquisa no banco e salva no @current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # converte pra boolean
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to do that"
      redirect_to root_path
    end
  end

end
