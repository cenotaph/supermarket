class Menu < ActiveRecord::Base
  acts_as_tree
  belongs_to :subsite
  validates_presence_of :subsite_id
  belongs_to :item, polymorphic: true
  before_save :check_sort_order
  
  scope :published, -> { where(published: true)}
  scope :by_subsite, ->(x) { where(subsite_id: x)}
  
  def check_sort_order
    self.sort_order = (sort_order.nil? ? 1 : sort_order)
  end
  
  def link
    if item_type == 'Page'
      "/pages/" + item.slug
    elsif item_type == 'Internallink'
      "/" + [item.controller, item.action, item.parameter].delete_if{|x| x.blank?}.compact.join("/")
    end
  end
end
