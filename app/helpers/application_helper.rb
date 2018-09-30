module ApplicationHelper
  include AutoHtml
  include Twitter::TwitterText::Autolink
  
  def check_filter(initial, filter_scope, class_name)
    if session[:filter_scope].nil?
      return false
    elsif session[:filter_scope][filter_scope].nil?
      return false
    else
      (initial & session[:filter_scope][filter_scope]).empty? ? false : class_name
    end
  end
  
  def class_test(condition = true, class_to_set)
    begin
      if condition.nil?
        return false
      else 
        condition == true ? class_to_set : false
      end
    rescue 
      false
    end
  end
  
  def figure_video_type(video, width = 800, height = 600)
    link_filter = AutoHtml::Link.new(target: '_blank')
    if video.video_provider == 'youtube' || video.url =~ /youtube\.com/
      return link_filter.call(video.url) { youtube(:width => width, :height => height)}
    elsif video.video_provider == 'vimeo'|| video.url =~ /vimeo\.com/
      return link_filter.call(video.url) { vimeo(:width => width, :height => height)}
    end
  end


  def share_this(item)
  
    out = "<span class='st_sharethis' st_title='" + item.name + "' st_url='http://#{request.host}" + url_for(item) + "' displayText=''></span><span class='st_facebook' st_title='" + item.name + "' st_url='http://#{request.host}" + url_for(item) + "'  displayText=''></span>"
    out += "<span class='st_digg' st_title='" + item.name + "' st_url='http://#{request.host}" + url_for(item) + "'  displayText=''></span><span class='st_twitter' st_title='" + item.name + "' st_url='http://#{request.host}" + url_for(item) + "'  displayText=''></span>"
    out += "<span class='st_reddit' st_title='" + item.name + "' st_url='http://#{request.host}" + url_for(item) + "'  displayText=''></span><span class='st_plusone' st_title='" + item.name + "' st_url='http://#{request.host}" + url_for(item) + "'  displayText=''></span>"
    out += "<span class='st_email' st_title='" + item.name + "' st_url='http://#{request.host}" + url_for(item) + "'  displayText=''></span>"
    return out.html_safe
  end
  
  def timeago(time, options = {})
    options[:class] ||= "timeago"
    content_tag(:abbr, time.to_s, options.merge(:title => time.getutc.iso8601)) if time
  end
    
end
