class Users::SessionsController < Devise::SessionsController
    
    # GET /resource/sign_in
    def new
        super
    end


    # POST /resource/sign_in
    def create
        self.resource = warden.authenticate!(auth_options)
        #set_flash_message(:notice, :signed_in) if is_flashing_format?
        sign_in(resource_name, resource)
        yield resource if block_given?
        
        render :json => {
            :success => true, 
            :auth_token => resource.authentication_token, 
            :id => resource.id, 
            :first_name => resource.first_name, 
            :last_name => resource.last_name, 
            :email => resource.email, 
            :roles_masks => resource.roles_masks
        }
        return
    end

    # DELETE /resource/sign_out
    def destroy
        super
    end
end