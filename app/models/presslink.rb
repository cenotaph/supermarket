# frozen_string_literal: true

class Presslink < ActiveRecord::Base
  belongs_to :year
  belongs_to :subsite
  validates_presence_of :subsite_id, :year_id, :title
  mount_uploader :attachment, AttachmentUploader

  scope :by_subsite, ->(x) { where(subsite_id: x) }
  scope :by_year, ->(x) { where(year_id: x) }
end
