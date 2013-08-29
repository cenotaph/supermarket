class Application < ActiveRecord::Base
  resourcify
  belongs_to :space
  belongs_to :year
  belongs_to :user
  
  has_many :websites
  has_many :applicationwebimages
  has_many :applicationlinks
  has_many :videolinks
  
  validates :organisation_name, :presence => true, :if => :finished?
  validates :space_id, :presence => true
  validates_uniqueness_of :space_id, :scope => :year_id
  validates :year, :presence => true

  accepts_nested_attributes_for :space
  accepts_nested_attributes_for :applicationlinks
  accepts_nested_attributes_for :videolinks
  accepts_nested_attributes_for :applicationwebimages

  mount_uploader :application_image, ApplicationimageUploader
  
  # attr_accessible :status, :year_id, :organisation_name, :contact_email, :contact_first_name, :contact_last_name, :space_id, :user_id, :application_image, :space_attributes, :hometown, :staff, :exhibitor_address1, :exhibitor_address2, :exhibitor_city, :exhibitor_state, :exhibitor_country, :exhibitor_postcode, :form_direction, :contact_phone

  attr_accessor :form_direction
  
  def booth_type
    case booth_applied
    when 2
      'large'
    when 3
      'small'
    when 4
      'stand'
    else
      'unknown'
    end
  end
  
  def contact_full_address
    [contact_address1, contact_address2, contact_postcode.to_s + " " + contact_city.to_s, contact_state, contact_country].delete_if(&:blank?).join('<br />')
  end

  def exhibitor_full_address
    wouldbe = [exhibitor_address1, exhibitor_address2, exhibitor_postcode.to_s + " " + exhibitor_city.to_s, exhibitor_state, exhibitor_country].delete_if(&:blank?)
    wouldbe.empty? ? contact_full_address : wouldbe.join('<br />')
  end
  
  def contact_full_name
    [contact_first_name, contact_last_name].join(' ')
  end
  
  def finished?
    status == 'active'
  end
  
  def granted_result
    case booth_granted
    when 1
      'accepted'
    when 2
      'not_accepted'
    when 3
      'huh'
    else
      'unknown'
    end
  end
  

end
