# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
#  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  include FacebookerAuthentication::Controller

  before_filter :facebook_login_required
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def find_user
     if params[:user_id]
        @user = User.find(params[:user_id])
      else
        @user = current_user
      end
  end
end
