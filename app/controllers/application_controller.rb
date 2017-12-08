class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    lists_path
  end

  protected
  def require_login
    unless user_signed_in?
      redirect_to new_user_session_path, notice: 'You must be logged in'
    end
  end
end
