class Exhibitionspacetype < ActiveRecord::Base
  has_many :spaces
  translates :name
end