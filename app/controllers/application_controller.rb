class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  # added this 4/14 for fixing users error
  #before_action :configure_permitted_parameters, if: :devise_controller?

  after_action :verify_authorized, :except => :index
  after_action :verify_policy_scoped, :only => :index

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
  # redirect_to(request.referrer || root_path)
  end

end
