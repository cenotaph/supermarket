module ApplicationHelper
  include AutoHtml
  
  def figure_video_type(video, width = 800, height = 600)
    if video.video_provider == 'youtube'
      return auto_html(video.url) { youtube(:width => width, :height => height)}
    elsif video.video_provider == 'vimeo'
      return auto_html(video.url) { vimeo(:width => width, :height => height)}
    end
  end
  
end
