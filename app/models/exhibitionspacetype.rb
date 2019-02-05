# frozen_string_literal: true

class Exhibitionspacetype < ActiveRecord::Base
  has_many :spaces
  translates :name
end
