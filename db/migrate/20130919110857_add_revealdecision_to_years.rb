# frozen_string_literal: true

class AddRevealdecisionToYears < ActiveRecord::Migration
  def change
    add_column :years, :reveal_decisions, :boolean, null: false, default: false
  end
end
