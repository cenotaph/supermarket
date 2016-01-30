class Pnp < ActiveRecord::Base
  belongs_to :year
  validates_presence_of :name, :email, :phone_number, :postal_address, :city, :country, :year_id
end
