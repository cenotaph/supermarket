class Funder < ActiveRecord::Base
  belongs_to :fundertype
  validates_presence_of :fundertype_id, :name
  mount_uploader :logo, ImageUploader
  has_and_belongs_to_many :years
  
  scope :by_year, ->(x) { joins(:years).where(["years.year => ?", x]) } 
  accepts_nested_attributes_for :years
end
