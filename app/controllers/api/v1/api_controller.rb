module Api::V1
    class ApiController < ApplicationController
        respond_to :json
        # Métodos globais
        acts_as_token_authentication_handler_for User
        before_action :require_authentication!
        load_and_authorize_resource
 

        rescue_from CanCan::AccessDenied do |exception|
            render :json => { :message=> exception.message, :status=>500}
        end
        
        private
            def require_authentication!
                throw(:warden, scope: :user) unless current_user.presence
                #@current_user ||= current_user
            end
    end
end
