# Controller for the mentor's students
class Api::V1::StudentsController < ApplicationController

  before_action :authenticate_user

  respond_to :json

  # Return all of the mentor's students
  # GET /api/v1/students
  def index
    puts render json: @user, serializer: MentorStudentsSerializer
  end


  private
  # Authenticate by token in header
  def authenticate_user
    authenticate_or_request_with_http_token do |token, options|
      @user = User.find_by_auth_key(token)
      head :unauthorized unless @user
      return
    end
  end

end
