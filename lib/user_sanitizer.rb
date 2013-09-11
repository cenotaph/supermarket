class User::ParameterSanitizer < Devise::ParameterSanitizer
    private
    def account_update
        default_params.permit(:display_name, :photo, :email, :password, :password_confirmation, :current_password)
    end
    
    def sign_up
      default_params.permit(:email, :password, :display_name, :password_confirmation)
    end
    
    def sign_in
      default_params.permit(:email, :password, :remember_token, :remember_created_at, :sign_in_count)
    end
    
end