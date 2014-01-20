class Video < ActiveRecord::Base
  belongs_to :subsite
  belongs_to :year
  belongs_to :videohost
  
  before_save :populate_other_fields

  scope :by_subsite, ->(x) { where(subsite_id: x ) }
  scope :published, -> {  where(published: true)  }
  
  mount_uploader :thumbnail, ImageUploader
  
  attr_accessor :in_url
  
  def populate_other_fields
    if in_url =~ /youtube/ || in_url =~ /youtu\.be/
      client = YouTubeIt::Client.new(:dev_key => YOUTUBE_API)
      self.provider_id = in_url.match(/^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/)[7] || 'error'
      self.videohost_id = 1
      v = client.video_by(provider_id)
      self.title = v.title
      self.description = v.description
      self.remote_thumbnail_url = v.thumbnails.sort_by(&:width).last.url rescue nil
      self.duration = v.duration
    elsif in_url =~ /vimeo/
      self.provider_id = in_url.match(/^\D*\/(\d*).*/)[1] || 'error'
      self.videohost_id = 2
      v = Vimeo::Simple::Video.info(provider_id).first
      self.title = v['title']
      self.description = v['description']
      self.remote_thumbnail_url = v['thumbnail_large']
      self.video_width = v['width']
      self.video_height = v['height']
      self.duration = v['duration']
    end
    if thumbnail.present?
      self.thumbnail_content_type = thumbnail.file.content_type
      self.thumbnail_size = thumbnail.file.size
      self.thumbnail_width, self.thumbnail_height = `identify -format "%wx%h" #{thumbnail.file.path}`.split(/x/)
    end
    if provider_id == 'error' || provider_id.blank?
      errors.add(:provider_id, "Could not load video with this URL")
    end
    if videohost_id.blank?
      errors.add(:videohost_id, "Videohost needs to be YouTube or Vimeo")
    end
  end
  
  
  def url
    videohost_id == 1 ? "http://www.youtube.com/watch?v=#{provider_id}" : "http://vimeo.com/#{provider_id}"
  end
  
  def video_provider
    videohost.name
  end
end
