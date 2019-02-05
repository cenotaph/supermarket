# frozen_string_literal: true

class Videohost < ActiveRecord::Base
  has_many :videos
end
