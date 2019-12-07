# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def index
    @users = User.all

    render json: @users.to_json(only: %i[id username email])
  end

  def show
    render json: @user.to_json(only: %i[id username email])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user.to_json(only: %i[id username email]), status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
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

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
