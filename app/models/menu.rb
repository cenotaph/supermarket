class Menu < ActiveRecord::Base
  acts_as_tree
  belongs_to :subsite
  validates_presence_of :subsite_id
  belongs_to :item, polymorphic: true
  before_save :check_sort_order
  
  scope :published, -> { where(published: true)}
  
  def check_sort_order
    sort_order ||= 1
  end
  
  # def link
  #   if item_type == 'Page'
  #     "/pages/" + item.slug
  #   elsif item_type == 'Internallink'
  #     "/#{item.controller}/#{item.action}#{!item.parameter.blank? ? '/' + item.parameter : ''}"
  #   end
  # end
end
