module Api::V1
    class ApiController < ApplicationController
        respond_to :json
        # Métodos globais
        load_and_authorize_resource
        acts_as_token_authentication_handler_for User, fallback_to_devise: false
        protect_from_forgery with: :null_session
 
        before_action :require_authentication!

        rescue_from CanCan::AccessDenied do |exception|
            render :json => { :json=> exception.message, :status=>500}
        end
        
        private
            def require_authentication!
                throw(:warden, scope: :user) unless current_user.presence
            end
    end
end