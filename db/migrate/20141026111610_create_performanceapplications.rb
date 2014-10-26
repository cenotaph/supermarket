class CreatePerformanceapplications < ActiveRecord::Migration
  def change
    create_table :performanceapplications do |t|
      t.references :user, index: true
      t.references :year, index: true
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.string :description, limit: 1000
      t.string :prep_time
      t.string :performance_time
      t.string :num_of_participants_on_stage
      t.string :number_of_participants_off_stage
      t.text :technical_requirements
      t.string :weblink1
      t.string :weblink2
      t.string :weblink3
      t.string :weblink4
      t.string :connection_to_visual_arts, limit: 500
      t.integer :decision
      t.string :attachment
      t.string :attachment_content_type
      t.string :attachment_file_size, :length => 8
      t.timestamps
    end
  end
end
