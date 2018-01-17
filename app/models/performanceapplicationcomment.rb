class Performanceapplicationcomment < ActiveRecord::Base
  belongs_to :user
  belongs_to :performanceapplication, foreign_key: :app_id

  validates_presence_of :user_id
end
