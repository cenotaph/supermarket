# frozen_string_literal: true

class BusinesstypeSpace < ActiveRecord::Base
  belongs_to :space
  belongs_to :businesstype
end
