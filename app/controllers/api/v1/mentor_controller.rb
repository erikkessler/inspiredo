class Api::V1::MentorController < ApplicationController
  
  respond_to :json

  def students
    puts "1"
    authenticate_or_request_with_http_token do |token, options|
      puts  "yolo"
      user = User.find_by_auth_key(token)
      head :unauthorized unless user
      render json: { :students => user.students }
    end
    puts "rolo"
  end
end
