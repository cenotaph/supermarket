class AddAcceptedTermsToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :accepted_terms, :boolean
  end
end
