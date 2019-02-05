# frozen_string_literal: true

class AddNumberAssistantsToPerformanceapplications < ActiveRecord::Migration
  def change
    add_column :performanceapplications, :number_of_assistants, :string
    add_column :performanceapplications, :additional_comments, :text
  end
end
