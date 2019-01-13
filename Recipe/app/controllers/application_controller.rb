class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_locale
	
	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
	end
	
	def set_locale
	  logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
	  I18n.locale = extract_locale_from_accept_language_header
	  logger.debug "* Locale set to '#{I18n.locale}'"
	end
	
	private
	def extract_locale_from_accept_language_header
	  request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
	end

end
