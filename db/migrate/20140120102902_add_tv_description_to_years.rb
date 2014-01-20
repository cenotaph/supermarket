class AddTvDescriptionToYears < ActiveRecord::Migration
  def change
    add_column :years, :tv_description, :text
  end
end
