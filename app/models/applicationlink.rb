# frozen_string_literal: true

class Applicationlink < ActiveRecord::Base
  belongs_to :application
  validates_presence_of :url, :application_id

  def url_safe
    if url[%r{^http://}] || url[%r{^https://}]
      url
    else
      self.url = 'http://' + url
    end
  end
end
