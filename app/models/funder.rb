class Funder < ActiveRecord::Base
  belongs_to :fundertype
  validates_presence_of :fundertype_id, :name
  mount_uploader :logo, ImageUploader
end
