# frozen_string_literal: true

class Space < ActiveRecord::Base
  resourcify
  belongs_to :exhibitionspacetype
  has_many :space_users, dependent: :destroy
  has_many :applications, dependent: :destroy
  has_many :space_users, dependent: :destroy
  has_many :users, through: :space_users
  has_many :businesstype_spaces, dependent: :delete_all
  has_many :businesstypes, through: :businesstype_spaces
  has_many :organisationtype_spaces, dependent: :delete_all
  has_many :organisationtypes, through: :organisationtype_spaces, dependent: :destroy
  has_many :activity_spaces, dependent: :destroy
  has_many :activities, through: :activity_spaces, dependent: :destroy
  has_many :websites, dependent: :destroy
  has_many :spacecomments, dependent: :delete_all

  accepts_nested_attributes_for :websites
  accepts_nested_attributes_for :businesstypes
  accepts_nested_attributes_for :organisationtypes
  accepts_nested_attributes_for :activities

  mount_uploader :logo, ImageUploader
  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :image4, ImageUploader

  extend FriendlyId
  friendly_id :business_name, use: %i[slugged finders]

  geocoded_by :full_street_address
  after_validation :geocode

  attr_accessor :form_direction
  # attr_accessible :business_name, :city, :country, :businesstype_ids, :status, :id, :address1, :address2, :state, :exhibitionspacetype_id, :exhibitors

  validates :business_name, :country, :contact_email, presence: true, if: :finished?
  validate :validate_not_both_approved_and_denied

  scope :approved, -> { where('approved is not false') }
  scope :denied, -> { where(denied: true) }
  scope :by_approval, ->(condition) { where(approved: (condition == 'true')) }
  scope :unapproved, -> { where(approved: false).where('denied is not true') }
  scope :by_country, ->(x) { where(['lower(country) in (?) OR lower(visiting_country) in (?)', x.map(&:downcase), x.map(&:downcase)]) }
  scope :by_activity, ->(x) { includes(:activity_spaces).where('activity_spaces.activity_id' => x) }
  scope :by_exhibitionspacetype, ->(x) { where(exhibitionspacetype_id: x) }
  scope :by_businesstype, ->(x) { includes(:businesstype_spaces).where('businesstype_spaces.businesstype_id' => x) }
  scope :by_organisationtype, ->(x) { includes(:organisationtype_spaces).where('organisationtype_spaces.organisationtype_id' => x) }

  def validate_not_both_approved_and_denied
    if approved == true && denied == true
      errors[:approved] << (options[:message] || "can't have both approved and denied")
     end
  end

  def allimages
    # local = [[image1, image1_caption].compact, [image2, image2_caption].compact, [image3, image3_caption].compact, [image4, image4_caption].compact ]
    local = []
    applications.sort_by { |x| x.year.year }.reverse.map(&:applicationwebimages).flatten.compact.map { |x| [x.imagefile, x.title] }.each { |x| local.push(x) }
    local.compact
  end

  def approved_users
    space_users.approved.map(&:user)
  end

  def full_street_address
    return false if country.blank?

    visiting = [visiting_address1, visiting_address2, visiting_city, visiting_state, visiting_postcode.to_s + ' ' + visiting_country.to_s].delete_if(&:blank?).compact.map(&:strip).join(', ')
    contact = [address1, address2, city, state, postcode.to_s + ' ' + (Country[country.to_s.downcase].class == FalseClass ? country.to_s.downcase : Country[country.to_s.downcase].name)].delete_if(&:blank?).compact.map(&:strip).join(', ')
    [visiting, contact].delete_if(&:blank?).first
  end

  def full_contact_address
    [address1, address2, city, state, postcode.to_s + ' ' + (Country[country.to_s.downcase].class == FalseClass ? country.to_s.downcase : Country[country.to_s.downcase].name)].delete_if(&:blank?).compact.map(&:strip).join(', ')
  end

  def finished?
    status == 'active'
  end

  def percent_complete
    '100'
  end

  def approved?
    approved
  end

  def denied?
    denied
  end

  def website1_safe
    if website1[%r{^http://}] || website1[%r{^https://}]
      website1
    else
      self.website1 = 'http://' + website1
    end
  end

  def website2_safe
    if website2[%r{^http://}] || website2[%r{^https://}]
      website2
    else
      self.website2 = 'http://' + website2
    end
  end

  def hometown
    [city, Country[country].blank? ? nil : Country[country].name].compact.join(', ')
  end

  def name
    business_name
  end
end
