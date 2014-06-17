class Api::V1::User::UsersController < ApplicationController
  
  respond_to :json

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: { status: "success", :token => user.auth_key, :email => user.email, :is_mentor => user.is_mentor, :is_parent => user.is_student }
      Rails.logger.debug "#{DateTime.current} - #{@user.email} created an account"
    else
      render json: { status: "failure", errors: user.errors }
    end
  end

  def edit
  end

  def update
    authenticate_or_request_with_http_token do |token, options|
      user = User.find_by_auth_key(token)
      head :unauthorized unless user
    end

    if user.update_attributes(user_params)
      render json: { status: "success", :token => user.auth_key, :email => user.email, :is_mentor => user.is_mentor, :is_parent => user.is_student }
    else
      render json: { status: "failure", errors: user.errors }
    end
  end

  def destroy
    authenticate_or_request_with_http_token do |token, options|
      user = User.find_by_auth_key(token)
      head :unauthorized unless user
    end

    user.destroy
    render json: { status:"success" }
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :is_student, :is_mentor)
    end
end
