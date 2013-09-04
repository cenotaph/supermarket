module ApplicationHelper
  include AutoHtml
  
  def figure_video_type(video, width = 800, height = 600)
    if video.video_provider == 'youtube' || video.url =~ /youtube\.com/
      return auto_html(video.url) { youtube(:width => width, :height => height)}
    elsif video.video_provider == 'vimeo'|| video.url =~ /vimeo\.com/
      return auto_html(video.url) { vimeo(:width => width, :height => height)}
    end
  end


  def share_this(item)
  
    out = "<span class='st_sharethis' st_title='" + item.name + "' st_url='http://#{request.host}" + url_for(item) + "' displayText=''></span><span class='st_facebook' st_title='" + item.name + "' st_url='http://#{request.host}" + url_for(item) + "'  displayText=''></span>"
    out += "<span class='st_digg' st_title='" + item.name + "' st_url='http://#{request.host}" + url_for(item) + "'  displayText=''></span><span class='st_twitter' st_title='" + item.name + "' st_url='http://#{request.host}" + url_for(item) + "'  displayText=''></span>"
    out += "<span class='st_reddit' st_title='" + item.name + "' st_url='http://#{request.host}" + url_for(item) + "'  displayText=''></span><span class='st_plusone' st_title='" + item.name + "' st_url='http://#{request.host}" + url_for(item) + "'  displayText=''></span>"
    out += "<span class='st_email' st_title='" + item.name + "' st_url='http://#{request.host}" + url_for(item) + "'  displayText=''></span>"
    return out.html_safe
  end
  
    
end
