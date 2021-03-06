# frozen_string_literal: true

class Application < ActiveRecord::Base
  resourcify
  belongs_to :space
  belongs_to :year
  belongs_to :user

  has_many :websites, dependent: :destroy
  has_many :applicationwebimages, dependent: :destroy
  has_many :applicationlinks, dependent: :destroy
  has_many :videolinks, dependent: :destroy
  has_many :applicationcomments, dependent: :destroy

  validates :organisation_name, presence: true, if: :finished?
  validates :space_id, presence: true
  validates_uniqueness_of :space_id, scope: :year_id
  validates :year, presence: true

  accepts_nested_attributes_for :space
  accepts_nested_attributes_for :applicationlinks, reject_if: proc { |attr| attr['url'].blank? }, allow_destroy: true
  accepts_nested_attributes_for :videolinks, reject_if: proc { |attr| attr['url'].blank? }, allow_destroy: true
  accepts_nested_attributes_for :applicationwebimages, reject_if: proc { |attr| attr['imagefile'].blank? && attr['id'].blank? }, allow_destroy: true

  mount_uploader :application_image, ApplicationimageUploader
  mount_uploader :upload1, AttachmentUploader
  mount_uploader :upload2, AttachmentUploader

  before_save :sync_with_space

  scope :by_year, ->(x) { where(year_id: x) }
  scope :approved, -> { includes(:year).where('booth_granted >= 1 and booth_granted <= 3 or booth_granted = 7 and years.reveal_decisions is true').references(:years) }
  scope :approved_preview, -> { where('booth_granted >= 1 and booth_granted <= 3 or booth_granted = 7') }
  scope :stands, -> { where(booth_granted: 3) }
  scope :booths, -> { where('booth_granted = 1 OR booth_granted = 2') }
  scope :associates, -> { where(booth_granted: 7) }
  scope :accepted_terms, -> { where(accepted_terms: true) }
  # attr_accessible :status, :year_id, :organisation_name, :contact_email, :contact_first_name, :contact_last_name, :space_id, :user_id, :application_image, :space_attributes, :hometown, :staff, :exhibitor_address1, :exhibitor_address2, :exhibitor_city, :exhibitor_state, :exhibitor_country, :exhibitor_postcode, :form_direction, :contact_phone

  attr_accessor :form_direction

  def approved?
    if year.allow_editing == true && submitted_at && submitted_at > year.registration_deadline
      true
    elsif booth_granted.nil?
      false
    elsif (booth_granted >= 1 && booth_granted <= 4 ) || booth_granted == 7
      year.allow_editing == true ? true : year.reveal_decisions
    else
      false
    end
  end

  def approved_pending_reveal?
    if booth_granted.nil?
      false
    elsif booth_granted >= 1 && booth_granted <= 3
      true
    else
      false
    end
  end

  def granted_result
    case booth_granted
    when 1
      'accepted - large booth'
    when 2
      'accepted - small booth'
    when 3
      'accepted - presentation stand'
    when 4
      'not accepted'
    when 5
      'maybe'
    when 6
      'yes - PNP'
    when 7
      'yes - associate gallery'
    else
      'not decided yet'
    end
  end

  def booth_type
    case booth_applied
    when 2
      'large'
    when 3
      'small'
    when 4
      'stand'
    when 5
      'no_stand'
    else
      'unknown'
    end
  end

  def any_image(size = :sidebar)
    if application_image? && (application_image.url !~ /pdf$/i) && (application_image.url !~ /ai$/i) && (application_image.url !~ /tif$/i)
      application_image.url(size)

    elsif space.logo? && (application_image.url !~ /pdf$/i) && (application_image.url !~ /ai$/i) && (application_image.url !~ /tif$/i)
      space.logo.url(:profile)
    elsif !applicationwebimages.empty?
      applicationwebimages.to_a.delete_if { |x| x.imagefile =~ /pdf$/i }.first.imagefile.url(size)
    else
      '/assets/missing-120.png'
    end
  end

  def contact_full_address
    [contact_address1, contact_address2, contact_postcode.to_s + ' ' + contact_city.to_s, contact_state, contact_country.blank? ? nil : (Country[contact_country].class == FalseClass ? contact_country : (Country[contact_country].nil? ? contact_country : Country[contact_country].name))].delete_if(&:blank?).join('<br />')
  end

  def exhibitor_full_address
    wouldbe = [exhibitor_address1, exhibitor_address2, exhibitor_postcode.to_s + ' ' + exhibitor_city.to_s, exhibitor_state, exhibitor_country.blank? ? nil : written_country ].delete_if(&:blank?)
     # (Country[exhibitor_country].class == FalseClass ? exhibitor_country : Country[exhibitor_country].name)]
    wouldbe.empty? ? contact_full_address : wouldbe.join('<br />')
  end

  def contact_full_name
    [contact_first_name, contact_last_name].join(' ')
  end

  def finished?
    status == 'active'
  end

  def organisation_email
    space.contact_email
  end

  def organisation_email=(email)
    space.update_attribute(:contact_email, email)
  end

  def newer_than_this?
    space.applications.to_a.delete_if { |x| x == self }.map { |x| x.year.year }.map { |x| x > year.year }.include?(true)
  end

  def sync_with_space
    unless newer_than_this?
      if contact_address1_changed?
        space.address1 = contact_address1
        space.address2 = contact_address2
      end
      if contact_city_changed?
        space.city = contact_city
        space.state = contact_state
        space.postcode = contact_postcode
      end
      space.country = contact_country if contact_country_changed?
      space.phone = contact_phone if contact_phone_changed?
      if exhibitor_address1_changed?
        space.visiting_address1 = exhibitor_address1
        space.visiting_address2 = exhibitor_address2
      end
      if exhibitor_city_changed?
        space.visiting_city = exhibitor_city
        space.visiting_state = exhibitor_state
        space.visiting_postcode = exhibitor_postcode
      end
      space.visiting_country = exhibitor_country if exhibitor_country_changed?
      space.approved = true if [1, 2, 3, 6].include?(booth_granted)
      # if booth_granted == 4
      #   space.approved = false
      # end

      space.save if space.changed?
    end
  end

  def hometown_or_city
    if hometown.blank?
      if exhibitor_city.blank?
        space.city.to_s
      else
        exhibitor_city.to_s
      end
    else
      hometown.to_s
    end
  end

  def written_country
    if hometown.blank?
      out = ''
      out += if exhibitor_city.blank?
               space.city.to_s.humanize + ', '
             else
               exhibitor_city.humanize + ', '
             end
    else
      out = hometown + ', '
    end
    if informal_country.blank?
      out += if exhibitor_country.blank?
               if space.country.blank?
                 space.visiting_country
               else
                 out += if Country[space.country].class == FalseClass
                          space.country
                        else
                          Country[space.country].name
                        end
                      end
             else
               if Country[exhibitor_country].class == FalseClass
                 exhibitor_country
               else
                 Country[exhibitor_country].name
                      end
             end
    else
      out += informal_country
    end
  end
end
