class Api::V1::Accounts::UsersController < ApplicationController
  
  respond_to :json

  def new
  end

  def create
    user = User.new(user_params)


    # TODO- check if user exists; handle on front end
    if user.is_student
      if User.find_by_email(user.email).nil?
        pass = (("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a).shuffle.first(8).join
        puts pass
        user.password = pass
        user.password_confirmation = pass
        if user.save
          UserMailer.add_student(user, params[:mentor]).deliver
          render json: { status: "success" } and return

        else
          render json: { :error => user.errors.full_messages, :status => 422 } and return
        end

      else
        UserMailer.add_existing_student(user, params[:mentor]).deliver
        render json: { status: "success" } and return 
      end
    end
    if user.save
      render json: { status: "success", :token => user.auth_key, :email => user.email, :is_mentor => user.is_mentor, :is_parent => user.is_student }
      Rails.logger.debug "#{DateTime.current} - #{user.email} created an account"
    else
      render json: { :error => user.errors.full_messages, :status => 422 }
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
