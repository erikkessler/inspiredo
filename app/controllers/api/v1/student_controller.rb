class Api::V1::StudentController < ApplicationController
  
  respond_to :json

  def contracts
    authenticate_or_request_with_http_token do |token, options|
      student = User.find_by_auth_key(token)
      head :unauthorized unless !student.nil?
      render json: student, serializer: UserSerializer, root: "students" 
    end
  end

  def activities
    authenticate_or_request_with_http_token do |token, options|
      student = User.find_by_auth_key(token)
      head :unauthorized unless !student.nil?
      render json: student, serializer: StudentActivitySerializer, root: false
    end
  end

  def update
    authenticate_or_request_with_http_token do |token, options|
      student = User.find_by_auth_key(token)
      head :unauthorized unless !student.nil?
      activity = student.activities.find(params[:id])
      head :unauthorized unless !activity.nil?
      activity.name = params[:activity][:name]
      activity.count = params[:activity][:count]
      if activity.save
        render json: activity
      else
        render json: { errors: activity.errors.full_messages }
      end
    end
  end

end
