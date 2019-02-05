# frozen_string_literal: true

class Year < ActiveRecord::Base
  has_many :applications
  has_many :videos
  has_and_belongs_to_many :funders

  def name
    year
  end

  def open?
    applications_open
  end

  def preview_open?
    Time.now.to_date < registration_deadline
  end
end
