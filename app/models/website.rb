class Website < ActiveRecord::Base
  belongs_to :application
  
  def url_safe
    if self.url[/^http:\/\//] || self.url[/^https:\/\//]
      self.url
    else
      self.url = 'http://' + self.url
    end
  end
  
end
