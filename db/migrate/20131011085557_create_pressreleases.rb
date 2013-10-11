class CreatePressreleases < ActiveRecord::Migration
  def change
    create_table :pressreleases do |t|
      t.string :title
      t.date :date_of_release
      t.text :description
      t.string :attachment_eng
      t.string :attachment_swe
      t.string :image
      t.boolean :published
      t.references :year, index:true
      t.references :subsite, index: true

      t.timestamps
    end
  end
end
