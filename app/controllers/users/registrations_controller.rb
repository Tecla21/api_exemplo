class Users::RegistrationsController < Devise::RegistrationsController
    def new
        super
    end

    def create
        # add custom create logic here
        build_resource(sign_up_params)

        resource.save
        yield resource if block_given?
        if resource.persisted?
            if resource.active_for_authentication?
                sign_up(resource_name, resource)
                #respond_with resource, location: after_sign_up_path_for(resource)

                render :json=> resource.as_json(:auth_token=>resource.authentication_token, :email=>resource.email), :status=>201
                return
            else
                expire_data_after_sign_in!
                warden.custom_failure!
                render :json=> resource.errors, :status=>422
            end
        else
            clean_up_passwords resource
            set_minimum_password_length
            render :json=> resource.errors, :status=>500
        end
    end

    def update
        super
    end
end