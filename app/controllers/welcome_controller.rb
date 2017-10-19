class WelcomeController < ApplicationController
  skip_before_action :authenticate_api_key, only: [:index]

  def index
    @tenants = Tenant.all
  end
end
