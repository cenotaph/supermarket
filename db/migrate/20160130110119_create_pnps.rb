class CreatePnps < ActiveRecord::Migration
  def change
    create_table :pnps do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :postal_address
      t.string :city
      t.string :country
      t.string :postcode
      t.string :organisation
      t.string :other_organisations
      t.string :others_from_same
      t.boolean :programme_meetings
      t.boolean :programme_party
      t.boolean :programme_discussion
      t.boolean :programme_lounge
      t.boolean :programme_exhibitions
      t.boolean :programme_exhibitors
      t.boolean :programme_talks
      t.boolean :programme_performances
      t.boolean :hope_newpartners
      t.boolean :hope_newknowledge
      t.boolean :hope_othercountries
      t.boolean :hope_exhibitionpossibilities
      t.boolean :hope_supermarketoverall
      t.integer :role_in_scene
      t.string :languages
      t.boolean :willing_to_do_survey
      t.string :planning_to_write
      t.text :other_comments
      t.references :year, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
