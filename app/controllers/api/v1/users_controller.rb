class Api::V1::UsersController < Api::V1::ApplicationController
  def index
    users = User.all
    render json: { status: 'Success', message: 'Users loaded successfully', data: users }, status: :ok
  end

  def show
    user = User.find_by(id: params[:id])
    render json: { status: 'Success', message: 'User loaded successfully', data: user }, status: :ok
  end
end