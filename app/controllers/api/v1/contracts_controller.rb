# Controller for contracts
class Api::V1::ContractsController < ApplicationController
  
  before_action :authenticate_user

  respond_to :json

  # Return all of the student's contracts
  # GET /api/v1/contracts
  def index
    render json: @user.contracts, each_serializer: ContractSerializer
  end

  # Create a contract - as mentor
  # POST /api/v1/contracts
  def create
    (head :unauthorized unless @user.students.find_by_id(params[:contract][:user_id])) and return

    contract = Contract.new(contract_params)
    if contract.save
      puts render json: contract
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
        return
      end
    end

    def contract_params
      params.require(:contract).permit(:name, :reward, :user_id, :needed)
    end

  
end
