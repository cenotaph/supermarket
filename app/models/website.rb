# frozen_string_literal: true

class Website < ActiveRecord::Base
  belongs_to :application

  def url_safe
    if url[%r{^http://}] || url[%r{^https://}]
      url
    else
      self.url = 'http://' + url
    end
  end
end
