class ActivitySpace < ActiveRecord::Base
  belongs_to :activity
  belongs_to :space
end