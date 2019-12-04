# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :favourites, dependent: :destroy
end
