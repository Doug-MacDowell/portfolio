class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  #after_action :verify_policy_scoped, :only => :index
  #after_action :verify_authorized, :except => :index

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
  end

end
