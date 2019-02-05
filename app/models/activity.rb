# frozen_string_literal: true

class Activity < ActiveRecord::Base
  has_many :activity_spaces
  has_many :spaces, through: :activity_spaces
  translates :name
end
