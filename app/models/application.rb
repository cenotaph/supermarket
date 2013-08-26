class Application < ActiveRecord::Base
  resourcify
  belongs_to :year
  belongs_to :user
  validates :organisation_name, :presence => true, :if => :finished?
  validates :space_id, :presence => true
  validates_uniqueness_of :space_id, :scope => :year_id
  validates :year, :presence => true
  belongs_to :space
  accepts_nested_attributes_for :space
  has_many :websites
  
  mount_uploader :application_image, ApplicationimageUploader
  
  # attr_accessible :status, :year_id, :organisation_name, :contact_email, :contact_first_name, :contact_last_name, :space_id, :user_id, :application_image, :space_attributes, :hometown, :staff, :exhibitor_address1, :exhibitor_address2, :exhibitor_city, :exhibitor_state, :exhibitor_country, :exhibitor_postcode, :form_direction, :contact_phone

  attr_accessor :form_direction


  def finished?
    status == 'active'
  end


end
