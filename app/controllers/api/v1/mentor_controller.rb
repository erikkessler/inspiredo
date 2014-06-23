class Api::V1::MentorController < ApplicationController
  
  respond_to :json

  def students
    authenticate_or_request_with_http_token do |token, options|
      user = User.find_by_auth_key(token)
      head :unauthorized unless !user.nil?
      render json: user, serializer: StudentSerializer, root: "students" 
      #render json: { :students => user.students }
    end
  end

  def create_contract
    authenticate_or_request_with_http_token do |token, options|
      user = User.find_by_auth_key(token)
      head :unauthorized unless !user.nil?
      contract = Contract.new(name: params[:contract][:name], reward: params[:contract][:reward], user_id: params[:contract][:student])

      if contract.save
        render json: contract
      else
        render json: { errors: contract.errors.full_messages }
      end
    end
  end
end
