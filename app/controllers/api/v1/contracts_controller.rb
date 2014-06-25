# Controller for contracts
class Api::V1:ContractsController < ApplicationController
  
  before_action :authenticate_user

  respond_to :json

  # Return all of the student's contracts
  # GET /api/v1/contracts
  def index
    render json: @user, serializer: StudentContractSerializer, root: false
  end

  # Create a contract
  # POST /api/v1/contracts
  def create
    head :unauthorized unless @user.students.find(params[:student])

    contract = Contract.new(contract_params)
    if contract.save
      render json: contract
    else
      render json: { errors: contract.errors.full_messages }
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

    def contract_params
      params.require(:contract).permit(:name, :reward, :student, :needed)
    end

  
end
