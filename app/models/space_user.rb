class SpaceUser < ActiveRecord::Base
  include Tokenable
  belongs_to :space
  belongs_to :user
  before_save :check_for_token
  
  scope :approved, -> { where(approved: true) }
  
  def check_for_token
    if approved == false
      approval_token = generate_token
    end
  end

end
