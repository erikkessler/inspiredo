# Allows user to sign_in by checking the password and returning auth_token
class Api::V1::Accounts::SessionsController < ApplicationController

  respond_to :json

  # Sign inby getting an auth_key
  # POST /api/v1/accounts/sign_in
  def create
    
    user = User.authenticate(params[:email].downcase, params[:password])
    if !user.nil?
      hash = { :token => user.auth_key, :email => user.email, :is_mentor => user.is_mentor, :is_student => user.is_student, :status => "success" }
      render json: hash
    else
      render json: { :status => "error" } 
    end
  end


end
