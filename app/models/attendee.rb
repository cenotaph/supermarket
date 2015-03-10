class Attendee < ActiveRecord::Base
  belongs_to :year
  validates_presence_of :email, :year_id, :verification_code
  validates_uniqueness_of :email
  
  before_validation :generate_verification_code
  
  scope :by_year, ->(x) { where(:year_id => x)}

  
  def generate_verification_code
    self.verification_code = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)[0..5]
      break random_token unless Attendee.exists?(verification_code: random_token)
    end
    
  end
  
  
end
