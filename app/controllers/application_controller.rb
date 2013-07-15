class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  helper_method :current_user

  private

	def ensure_logged_in
		unless current_user
			flash[:alert] = "Please log in"
			redirect_to new_session_path
		end
	end

	def handle_unverified_request
		sign_out
    	super
  	end

end
