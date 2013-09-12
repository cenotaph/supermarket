class User < ActiveRecord::Base
  rolify
  paginates_per 50
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :encryptable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # attr_accessible :display_name, :email, :password, :password_confirmation, :timezone, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :password_salt
  validates :display_name, :presence => true
  has_many :spaces, :through => :space_users, :conditions => {  "space_users.approved" => true }
  has_many :pending_spaces, :through => :space_users, :conditions => { "space_users.approved" => false }, :source => :space
  has_many :space_users
  has_many :applications
  scope :all_staff, -> { where("id IN (?) OR id IN (?)", User.with_role(:staff), User.with_role(:god)) }
  
  mount_uploader :photo, AvatarUploader
  
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
  
  def is_staff?
    return true if has_role?(:staff) || has_role?(:god)
  end
  
  def protected_email
    first = email.split(/@/).first[0..1] + "<i>" + Array.new(email.split(/@/).first.size - 2, "x").join + "</i>"
    rest = email.split(/\@/).last.split(/\./).map{|x| x[0..1] + "<i>" + Array.new(x.size - 2, "x").join + "</i>"}.join('.')
    (first + "@" + rest).html_safe
  end
  
end
