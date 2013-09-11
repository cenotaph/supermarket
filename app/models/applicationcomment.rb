class Applicationcomment < ActiveRecord::Base
  belongs_to :user
  belongs_to :application
  
  validates_presence_of :user_id
  validates_presence_of :application_id
  
end
