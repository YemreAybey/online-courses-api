# frozen_string_literal: true

class Api::V1::CoursesController < ApplicationController
  # GET /courses
  def index
    @courses = Course.all

    render json: @courses.to_json(only: %i[id author duration detail])
  end
end
