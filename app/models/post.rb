class Post < ActiveRecord::Base
  belongs_to :subsite
  belongs_to :posted_by, :class_name => "User"
  belongs_to :last_edited_by, :class_name => "User"
  translates :subject, :body
  before_save :fill_published_at
  accepts_nested_attributes_for :translations
  validates_presence_of :posted_by_id, :slug, :subsite_id
  
  extend FriendlyId
  friendly_id :subject_en, use: [:finders, :slugged]
  
  mount_uploader :postimage, SlidingmenuUploader
  has_many :postslides
  
  accepts_nested_attributes_for :postslides, :reject_if => proc {|x| x['image'].blank? }, :allow_destroy => true
  
  scope :promoted, -> { where(promoted: true) }
  scope :published, -> { where(published: true) }
  scope :by_subsite, ->(x) { where(subsite_id: x) }
  
  def fill_published_at
    self.published_at ||= Time.now
  end
  
  def subject_en
    subject(:en)
  end
  
  def name
    subject
  end
  
end
