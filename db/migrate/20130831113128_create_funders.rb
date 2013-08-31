class CreateFunders < ActiveRecord::Migration
  def change
    create_table :funders do |t|
      t.string :logo
      t.string :name
      t.string :url
      t.references :fundertype, index: true
      t.integer :sortorder

      t.timestamps
    end
  end
end
