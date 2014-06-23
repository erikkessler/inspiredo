class Api::V1::StudentController < ApplicationController
  
  respond_to :json

  def contracts
    authenticate_or_request_with_http_token do |token, options|
      student = User.find_by_auth_key(token)
      head :unauthorized unless !student.nil?
      render json: student, serializer: UserSerializer, root: "students" 
      #render json: { :students => user.students }
    end
  end

  def activities
    authenticate_or_request_with_http_token do |token, options|
      student = User.find_by_auth_key(token)
      head :unauthorized unless !student.nil?
      render json: student, serializer: StudentActivitySerializer, root: false
      #render json: { :students => user.students }
    end
  end

end
