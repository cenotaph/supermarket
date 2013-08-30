class Videolink < ActiveRecord::Base
  belongs_to :application
  validates_presence_of :url, :application_id

end
