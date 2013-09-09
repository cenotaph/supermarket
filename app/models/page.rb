class Page < ActiveRecord::Base
  # include ActsAsTree
  # extend ActsAsTree::Presentation
  resourcify
  
  translates :title, :body
  accepts_nested_attributes_for :translations, :reject_if => proc {|att| att['title'].blank? }
  # acts_as_tree
  has_many :subsites, :through => :page_subsites
  has_many :page_subsites
  belongs_to :background
  
  extend FriendlyId
  friendly_id :name_en, use: :slugged

  scope :published, -> { where(published: true) }
  scope :by_subsite, ->(x) { includes(:subsites).where(['subsites.id = ?', x]).references(:subsites)}
  scope :promoted, -> { where(show_on_bottom: true) }
  
  mount_uploader :postimage, SlidingmenuUploader

  def name_en
    title(:en)
  end
  
  def name
    title
  end



end