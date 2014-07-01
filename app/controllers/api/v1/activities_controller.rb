# Controller for activities - created by the mentor and check as compete by the student
class Api::V1::ActivitiesController < ApplicationController

  before_action :authenticate_user

  respond_to :json

  # Get the activities of a certain student
  # GET /api/v1/activities
  def index
    render json: @user.activities, each_serializer: ActivitySerializer
  end

  # Update an activity
  # PUT /api/v1/activities/:id
  def update
    activity = Activity.find_by_id(params[:id])
    (head :unauthorized unless activity) and return
    
    # try to update the attributes
    if activity.update_attributes(edit_activity_params)
      render json: activity
    else
      render json: { errors: activity.error.full_messages}
    end
  end

  # Create a new activity
  # POST /api/v1/activities
  def create
    #(head :unauthorized unless @user.contracts.find_by_id(params[:activity][:contract_id])) and return
    
    activity = Activity.new(activity_params)
    if activity.save
      render json: activity
    else
      render json: { errors: activity.errors.full_messages }
    end
  end

  # Delete an activity as a mentor
  # DELETE /api/v1/activities/:id
  def destroy
    (head :unauthorized unless @user.is_mentor) and return

    activity = Activity.find_by_id(params[:id])
    if activity.destroy
      head :ok
    else
      head :internal_server_error
    end
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

    # Params for an activity
    def activity_params
      params.require(:activity).permit(:name, :count, :value, :contract_id)
    end

    def edit_activity_params
      params.require(:activity).permit(:name, :count, :value, :complete_today, :state)
    end

end
