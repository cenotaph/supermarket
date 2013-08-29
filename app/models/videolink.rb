class Videolink < ActiveRecord::Base
  belongs_to :application
  validates_presence_of :url, :video_provider, :application_id

end
