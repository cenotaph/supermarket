class AddSubsiteIdToFrontcarousels < ActiveRecord::Migration
  def change
    add_reference :frontcarousels, :subsite, index: true
  end
end
