# frozen_string_literal: true

class Pnp < ActiveRecord::Base
  belongs_to :year

  scope :by_year, ->(x) { where(year_id: x) }
  validates_presence_of :name, :email, :phone_number, :postal_address, :city, :country, :year_id
end
