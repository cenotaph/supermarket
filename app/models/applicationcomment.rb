# frozen_string_literal: true

class Applicationcomment < ActiveRecord::Base
  belongs_to :user
  belongs_to :application, counter_cache: true

  validates_presence_of :user_id
  validates_presence_of :application_id
end
