class Api::V1::Accounts::SessionsController < ApplicationController

  respond_to :json

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if !user.nil?
      hash = { :token => user.auth_key, :email => user.email, :is_mentor => user.is_mentor, :is_parent => user.is_student, :status => "success" }
      render json: hash
    else
      render json: { :status => "error" } 
    end
  end

  def destroy
  end

end
