class Businesstype < ActiveRecord::Base
  has_many :spaces, :through => :businesstype_spaces
  has_many :businesstype_spaces
  translates :name
  
end