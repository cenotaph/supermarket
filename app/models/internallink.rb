class Internallink < ActiveRecord::Base
  belongs_to :subsite
  scope :by_subsite, ->(x) { where(subsite_id: x ) }
  has_many :menus, as: :item
end
