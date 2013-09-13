class Website < ActiveRecord::Base
  belongs_to :application
  
  def url_safe
    unless self.url[/^http:\/\//] || self.url[/^https:\/\//]
      self.url = 'http://' + self.url
    end
  end
  
end
