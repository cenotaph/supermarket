class CreateInternallinks < ActiveRecord::Migration
  def change
    create_table :internallinks do |t|
      t.references :subsite, index: true
      t.string :controller
      t.string :action
      t.string :parameter
      t.string :name
      t.boolean :published

      t.timestamps
    end
  end
end
