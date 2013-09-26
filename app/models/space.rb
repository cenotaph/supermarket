class Space < ActiveRecord::Base
  resourcify
  has_many :space_users, :dependent => :destroy
  has_many :applications, :dependent => :destroy
  has_many :users, :through => :space_users
  has_many :businesstypes, :through => :businesstype_spaces, :dependent => :destroy
  has_many :businesstype_spaces
  has_many :organisationtypes, :through => :organisationtype_spaces, :dependent => :destroy
  has_many :organisationtype_spaces
  has_many :activities, :through => :activity_spaces, :dependent => :destroy
  has_many :activity_spaces
  has_many :websites, :dependent => :destroy
  accepts_nested_attributes_for :websites
  accepts_nested_attributes_for :businesstypes
  belongs_to :exhibitionspacetype
  accepts_nested_attributes_for :organisationtypes
  accepts_nested_attributes_for :activities
  mount_uploader :logo, ImageUploader
  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :image4, ImageUploader
  extend FriendlyId
  friendly_id :business_name, use: :slugged
  geocoded_by :full_street_address  
  after_validation :geocode     
  attr_accessor :form_direction
  # attr_accessible :business_name, :city, :country, :businesstype_ids, :status, :id, :address1, :address2, :state, :exhibitionspacetype_id, :exhibitors

  
  validates :business_name, :country, :contact_email, :presence => true, :if => :finished?
  
  
  scope :approved, -> { where(approved: true)}
  
  def approved_users
    space_users.approved.map(&:user)
  end
  
  def full_street_address
    out = [visiting_address1, visiting_address2, visiting_city, visiting_state, visiting_postcode.to_s + " " +  visiting_country.to_s]
    out.compact.map(&:strip).join(', ')
  end
  
  def finished?
    status == 'active'
  end
  
  def hometown
    [city, Country[country].blank? ? nil : Country[country].name].compact.join(', ')
  end
  
  def name
    business_name
  end
  
end