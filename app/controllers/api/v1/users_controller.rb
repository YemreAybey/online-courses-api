class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /courses
  def index
    @users = User.all

    render json: @users.to_json(only: %i[id username email])
  end

  # GET /courses/1
  def show
    render json: @user.to_json(only: %i[id username email])
  end

  # POST /courses
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user.to_json(only: %i[id username email]), status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @user.update(user_params)
      render json: @user.to_json(only: %i[id username email])
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /courses/1
  def destroy
    @user.destroy
  end

  def find
    @user = User.find_by(email: params[:user][:email])
    if @user
      render json: @user
    else
      render json: @user.errors
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.


  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
