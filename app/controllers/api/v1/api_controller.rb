module Api::V1
    class ApiController < ApplicationController
        # Métodos globais
        acts_as_token_authentication_handler_for User, fallback_to_devise: false
        respond_to :json
        protect_from_forgery with: :null_session
 
        before_action :require_authentication!
        
        private
            def require_authentication!
                throw(:warden, scope: :user) unless current_user.presence
            end
    end
end