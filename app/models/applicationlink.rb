class Applicationlink < ActiveRecord::Base
  belongs_to :application
  validates_presence_of :url, :application_id
  
  def url_safe
    unless self.url[/^http:\/\//] || self.url[/^https:\/\//]
      self.url = 'http://' + self.url
    end
  end
end
