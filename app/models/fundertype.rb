# frozen_string_literal: true

class Fundertype < ActiveRecord::Base
  has_many :funders
  validates :name, presence: true
  scope :by_year, ->(year) { joins(funders: :years).where(['years.year = ?', year]) }
end
