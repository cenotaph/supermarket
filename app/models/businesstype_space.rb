class BusinesstypeSpace < ActiveRecord::Base
  belongs_to :space
  belongs_to :businesstype
end