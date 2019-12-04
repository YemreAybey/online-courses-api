# frozen_string_literal: true

class Api::V1::FavouritesController < ApplicationController
  before_action :authenticate_user
  def index
    @favourites = current_user.favourite_courses
    render json: @favourites.to_json(only: %i[id author duration detail])
  end

  def create
    fav = Favourite.find_by(user_id: current_user.id, course_id: params[:course_id])
    if !fav
      @favourite = current_user.favourites.build(fav_params)
      if @favourite.save
        @course = Course.find(@favourite.course_id)
        render json: @course.to_json(only: %i[id author duration detail]), status: :created
      else
        render json: @favourite.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'It is already favourited' }
    end
  end

  private

  def fav_params
    params.permit(:course_id)
  end
end
