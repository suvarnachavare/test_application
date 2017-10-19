class TenantsController < ApplicationController
   before_action :authenticate_api_key
   def show
    tenant = Tenant.find(params[:id])
    @tenant = tenant.to_json(include: { users: { include: 
                                                                         { questions: { include: 
                                                                             { answers: { only: :answers } } 
                                                                          } }
                                                                      } })
     respond_to do |format|
      format.json { render json: @tenant }
    end
  end

end
