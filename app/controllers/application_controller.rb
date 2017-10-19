class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_api_key

  private
  def authenticate_api_key
     if params[:api_key]
      @tenant = Tenant.where(api_key: params[:api_key])
      puts @tenant.inspect
      return @tenant ? true : false
    else
      respond_to do |format|
      format.json do
        self.status = :unauthorized
        self.response_body = { error: 'Access denied' }.to_json
      end
    end
    end
   end 
end
