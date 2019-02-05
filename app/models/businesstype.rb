# frozen_string_literal: true

class Businesstype < ActiveRecord::Base
  has_many :spaces, through: :businesstype_spaces
  has_many :businesstype_spaces
  translates :name
  accepts_nested_attributes_for :translations, reject_if: proc { |att| att['name'].blank? }
end
