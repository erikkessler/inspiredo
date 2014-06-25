# Controller for activities - created by the mentor and check as compete by the student
class Api::V1::ActivitiesController < ApplicationController

  before_action :authenticate_user

  respond_to :json

  # Get the activities of a certain student
  # GET /api/v1/activities
  def index
    render json: @user, serializer: StudentActivitySerializer, root: false
  end

  # Update an activity
  # PUT /api/v1/activities/:id
  def update
    activity = @user.activities.find(params[:id])
    head :unauthorized unless activity
    
    # try to update the attributes
    if @user.update_attributes(activity_params)
      render json: activity
    else
      render json: { errors: activity.error.full_messages}
    end
  end

  # Create a new activity
  # POST /api/v1/activities
  def create
    head :unauthorized unless @user.contracts.find(:contract)
    
    activity = Activity.new(activity_params)
    if activity.save
      render json: activity
    else
      render json: { errors: activity.errors.full_messages }
    end
  end
  
  private
    # Authenticate by token in header
    def authenticate_user
      authenticate_or_request_with_http_token do |token, options|
        @user = User.find_by_auth_key(token)
        head :unauthorized unless @user
      end
    end

    # Params for an activity
    def activity_params
      params.require(:activity).permit(:name, :count, :contract)
    end

end
