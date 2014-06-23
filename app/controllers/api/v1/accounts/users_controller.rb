class Api::V1::Accounts::UsersController < ApplicationController
  
  respond_to :json

  def new
  end

  def create
    user = User.new(user_params)


    # creating new student
    if user.is_student

      mentor = nil
      authenticate_or_request_with_http_token do |token, options|
        mentor = User.find_by_auth_key(token)
      end

      if User.find_by_email(user.email).nil?
        pass = (("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a).shuffle.first(8).join
        puts pass
        user.password = pass
        user.password_confirmation = pass
        if user.save
          mentor.relationships.create(:student_id => user.id)
          UserMailer.add_student(user, params[:mentor]).deliver
          render json: { status: "success" } and return

        else
          render json: { :error => user.errors.full_messages } and return
        end

      else
        
        if !mentor.students.where(:email => user.email).nil?
          render json: { :error => "Student is already added", :status => 422 } and return
        else
          UserMailer.add_existing_student(user, params[:mentor]).deliver
          render json: { status: "success" } and return 
        end
      end

      return
    end


    # creating a new mentor
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
      render json: { status: "failure", errors: user.errors.full_messages }
    end
  end

  def show
    authenticate_or_request_with_http_token do |token, options|
      user = User.find_by_auth_key(token)
      head :unauthorized unless user
      render json: { email: user.email, is_student: user.is_student, is_mentor: user.is_mentor }
    end

    return
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
