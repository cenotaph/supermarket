class Performanceapplication < ActiveRecord::Base
  belongs_to :user
  belongs_to :year
  validates_presence_of :contact_name, :user_id, :year_id, :contact_email, :contact_phone, :description, :prep_time, :performance_time, :num_of_participants_on_stage, :number_of_participants_off_stage, :technical_requirements
  mount_uploader :attachment, AttachmentUploader
  before_save :get_attachment_metadata
  scope :by_year, ->(x) { where(:year_id => x)}
  before_save :shorten_long_strings
  
  def shorten_long_strings
    description = description[0..999]
    connection_to_visual_arts = connection_to_visual_arts[0..499]
  end
  
  def get_attachment_metadata
    if attachment.present?
      if attachment.file.exists?
        self.attachment = attachment.file.content_type
        self.attachment_file_size = attachment.file.size
      end
    end    
  end
  
  def decision_text
    case decision 
    when nil
      'not decided yet'
    when 1
      'Accepted'
    when 2
      'No way'
    when 3
      'Maybe'
    end
  end
  
end
