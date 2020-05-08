class ApplicationController < ActionController::Base
  before_action :ensure_signed_in

  def current_user
    @current_user ||= User.find(current_user_id)
  end

  helper_method :current_user

  private

  def ensure_signed_in
    unless signed_in?
      sign_in_as_new_user
    end
  end

  def signed_in?
    current_user_id.present?
  end

  def sign_in_as_new_user
    user = User.create
    session[:current_user_id] = user.id
  end

  def current_user_id
    session[:current_user_id]
  end
end
