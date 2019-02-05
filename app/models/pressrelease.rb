# frozen_string_literal: true

class Pressrelease < ActiveRecord::Base
  belongs_to :subsite
  belongs_to :year
  validates_presence_of :year_id, :subsite_id, :title, :date_of_release

  mount_uploader :attachment_eng, AttachmentUploader
  mount_uploader :attachment_swe, AttachmentUploader
  mount_uploader :image, ImageUploader

  scope :by_subsite, ->(x) { where(subsite_id: x) }
  scope :by_year, ->(x) { where(year_id: x) }
  scope :published, -> { where(published: true) }
end
