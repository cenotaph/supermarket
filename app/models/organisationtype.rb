class Organisationtype < ActiveRecord::Base
  has_many :spaces, :through => :organisationtype_spaces
  has_many :organisationtype_spaces
  translates :name
  accepts_nested_attributes_for :translations, :reject_if => proc {|att| att['name'].blank? }  
  
end