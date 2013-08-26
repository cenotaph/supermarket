class Activity < ActiveRecord::Base

  belongs_to :activity_spaceend
  has_many :spaces, :through => :activity_spaces
  translates :name
end
