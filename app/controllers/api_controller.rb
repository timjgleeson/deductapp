class ApiController < ApplicationController
	def check_token
    token = params[:auth_token]
    
    if token.nil?
      render :status=>400, :json=>{:message=>"The request must contain an auth_token."}
      return
    end
  end
  
  def check_file
    if request.format != :json
      render :status=>406, :json=>{:message=>"The request must be json"}
      return
    end
  end

  def not_found
    Hash[:not_found => "Resource not found"]
  end
end
