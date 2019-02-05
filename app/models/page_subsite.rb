# frozen_string_literal: true

class PageSubsite < ActiveRecord::Base
  belongs_to :page
  belongs_to :subsite
end
