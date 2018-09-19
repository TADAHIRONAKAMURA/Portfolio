class ApplicationController < ActionController::Base

	 before_action :configure_permitted_parameters, if: :devise_controller?
	 protect_from_forgery with: :exception

	def location
		session[:return_to] = request.original_url
	end

	
	protected
	def configure_permitted_parameters
    	 # :password_confirmation, :registration_check を追加した。
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :email, :nickname, :password,:registration_check])
      devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :email, :nickname])
    end
end
