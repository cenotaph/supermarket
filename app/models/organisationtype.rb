class Organisationtype < ActiveRecord::Base
  has_many :spaces, :through => :organisationtype_spaces
  has_many :organisationtype_spaces
  translates :name
end