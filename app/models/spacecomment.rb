# frozen_string_literal: true

class Spacecomment < ActiveRecord::Base
  belongs_to :user
  belongs_to :space

  validates_presence_of :user_id
  validates_presence_of :space_id
  attr_accessor :deny_field
end
