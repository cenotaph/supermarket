class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.references :year, index: true
      t.string :first_name
      t.string :last_name
      t.string :organisation
      t.string :email
      t.string :verification_code
      t.boolean :arrival_status

      t.timestamps
    end
    
    add_index :attendees, :verification_code, unique: true
  end
end
