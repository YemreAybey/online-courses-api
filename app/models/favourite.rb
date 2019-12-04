# frozen_string_literal: true

class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :course
end
