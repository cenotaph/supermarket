# frozen_string_literal: true

class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.references :year, index: true
      t.string :organisation_name
      t.string :contact_first_name
      t.string :contact_last_name
      t.string :contact_moms
      t.string :contact_phone
      t.string :contact_address1
      t.string :contact_address2
      t.string :contact_city
      t.string :contact_postcode
      t.string :contact_country
      t.string :contact_email
      t.string :contact_email
      t.text :organisation_description
      t.string :exhibitor_address1
      t.string :exhibitor_address2
      t.string :exhibitor_city
      t.string :exhibitor_postcode
      t.string :exhibitor_country
      t.string :exhibitor_phone

      t.timestamps
    end
  end
end
