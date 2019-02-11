# frozen_string_literal: true

class AddInformalCountryToApplications < ActiveRecord::Migration
  def change
    execute('alter table applications add column informal_country varchar(255)')
  end
end
