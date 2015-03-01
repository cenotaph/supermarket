class User < ActiveRecord::Base
  rolify
  paginates_per 50
  has_many :authentications
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :encryptable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # attr_accessible :display_name, :email, :password, :password_confirmation, :timezone, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :password_salt
  validates :display_name, :presence => true

  has_many :space_users
  has_many :spaces,  through: :space_users
    has_many :approved_space_users, -> { where("space_users.approved = true")}, :class_name => "SpaceUser"
  has_many :pending_spaces, -> { where("space_users.approved = false").references([:spaces, :space_users]) }, through: :space_users, class_name: "Space", source: :space

  has_many :applications
  scope :all_staff, -> { where("id IN (?) OR id IN (?)", User.with_role(:staff).map(&:id), User.with_role(:god).map(&:id)) }
  accepts_nested_attributes_for :authentications, :reject_if => proc { |attr| attr['username'].blank? }
  accepts_nested_attributes_for :roles
  mount_uploader :photo, AvatarUploader
  
  scope :by_email, -> (name) { where("users.email ILIKE '%" + name + "%'")}


  def apply_omniauth(omniauth)
    if omniauth['provider'] == 'twitter'
      logger.warn(omniauth['info'].inspect)
 
      self.display_name = omniauth['info']['name']
      self.display_name.strip!
      identifier = omniauth['info']['nickname']

    elsif omniauth['provider'] == 'facebook'
      self.email = omniauth['info']['email'] if email.blank?
      
      self.display_name = omniauth['info']['first_name'] + ' ' + omniauth['info']['last_name']
      self.display_name.strip!
      identifier = omniauth['info']['nickname']
      # self.location = omniauth['extra']['user_hash']['location']['name'] if location.blank?
    elsif omniauth['provider'] == 'google_oauth2'
      self.email = omniauth['info']['email'] 
      self.display_name = omniauth['info']['name']

      identifier = omniauth['info']['email']
    end
    self.email = omniauth['info']['email'] if email.blank?
    self.password = SecureRandom.hex(32) if password.blank?  # generate random password to satisfy validations
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'], :username => identifier)
  end
  
  
  def avatar
    if photo?
      photo.url(:standard)
    else
      '/assets/supermarket2014/images/upload_pic.gif'
    end
  end
  
  def initiatives
    spaces.map(&:business_name).join('/')
  end
  
  def last_active_year
    lay = [last_sign_in_at.try(&:year), current_sign_in_at.try(&:year)] << applications.map{|x| x.year.year}
    # lay << spaces.map(&:updated_at)

    lay.flatten.compact.empty? ? updated_at.year : lay.flatten.uniq.compact.sort.last
    
  end
  
  def country
    spaces.map(&:country).join('/')
  end
  
  def is_aim_staff?
    return true if has_role?(:aim_staff) || has_role?(:god)
  end

  def is_staff?
    return true if has_role?(:staff) || has_role?(:god)
  end
  
  def protected_email
    first = email.split(/@/).first[0..1] + "<i>" + Array.new(email.split(/@/).first.size - 2, "x").join + "</i>"
    rest = email.split(/\@/).last.split(/\./).map{|x| x[0..1] + "<i>" + Array.new(x.size - 2, "x").join + "</i>"}.join('.')
    (first + "@" + rest).html_safe
  end
  

    
end
