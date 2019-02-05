# frozen_string_literal: true

class SpaceUser < ActiveRecord::Base
  include Tokenable
  belongs_to :space
  belongs_to :user
  before_save :check_for_token

  scope :approved, -> { where(approved: true) }

  def check_for_token
    approval_token = generate_token if approved == false
  end
end
