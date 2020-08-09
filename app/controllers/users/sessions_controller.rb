class Users::SessionsController < Devise::SessionsController

    #respond_to :json

    def create
      self.resource = warden.authenticate!(auth_options)
      #set_flash_message(:notice, :signed_in) if is_flashing_format?
      sign_in(resource_name, resource)
      yield resource if block_given?
      
      render :json=> {:success=>true, :auth_token=>resource.authentication_token, :first_name=>resource.first_name, :last_name=>resource.last_name, :email=>resource.email}
      return
    end
end