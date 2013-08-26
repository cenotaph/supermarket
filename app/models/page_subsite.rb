class PageSubsite < ActiveRecord::Base
  belongs_to :page
  belongs_to :subsite
end