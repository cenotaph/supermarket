class Fundertype < ActiveRecord::Base
  has_many :funders
  
  scope :by_year, ->(year) { joins(:funders => :years).where(["years.year = ?", year]) }
  
end
