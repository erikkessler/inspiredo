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
end
