class Api::V1::FeedItemsController < ApplicationController
  before_action :authenticate_user

  respond_to :json

  # Get the feed items of a certain student
  # GET /api/v1/feed_items
  def index
    render json: @user.feed_items, each_serializer: FeedItemSerializer
  end

  # Create a new feed item
  # POST /api/v1/feed_items
  def create    
    item = FeedItem.new(feed_params.merge({ user_id: @user.id }))
    if item.save
      render json: item
    else
      render json: { errors: item.errors.full_messages }
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
    def feed_params
      params.require(:feed_item).permit(:content)
    end
end
