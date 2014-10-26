class Performanceapplication < ActiveRecord::Base
  belongs_to :user
  belongs_to :year
  validates_presence_of :contact_name, :user_id, :year_id, :contact_email, :contact_phone, :description, :prep_time, :performance_time, :num_of_participants_on_stage, :number_of_participants_off_stage, :technical_requirements
  mount_uploader :attachment, AttachmentUploader
  before_save :get_attachment_metadata
  
  def get_attachment_metadata
    if attachment.present?
      if attachment.file.exists?
        self.attachment = attachment.file.content_type
        self.attachment_file_size = attachment.file.size
      end
    end    
  end
  
end
