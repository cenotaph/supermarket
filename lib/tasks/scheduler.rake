def strip_emoji ( str )
    str = str.force_encoding('utf-8').encode
    clean_text = ""

    # emoticons  1F601 - 1F64F
    regex = /[\u{1f600}-\u{1f64f}]/
    clean_text = str.gsub regex, ''

    #dingbats 2702 - 27B0
    regex = /[\u{2702}-\u{27b0}]/
    clean_text = clean_text.gsub regex, ''

    # transport/map symbols
    regex = /[\u{1f680}-\u{1f6ff}]/
    clean_text = clean_text.gsub regex, ''

    # enclosed chars  24C2 - 1F251
    regex = /[\u{24C2}-\u{1F251}]/
    clean_text = clean_text.gsub regex, ''

    # symbols & pics
    regex = /[\u{1f300}-\u{1f5ff}]/
    clean_text = clean_text.gsub regex, ''
end

def grabURL(url, home)
  require 'open-uri'
  open(home,"w").write(open(url).read)
end

desc "Get Instagram feed"
task :get_feed => [:environment] do




  # instagram ?
  
  require 'open-uri'
  require 'json'
  remove_emojis = /[\u{1F600}-\u{1F6FF}]/
  

  begin
    instagram = JSON.parse(open("https://www.instagram.com/supermarketart/media/").read)
    instagram['items'].each do |item|
      c = Cash.where(source: 'instagram',  issued_at: item["created_time"], sourceid: item["id"], 
                  title: strip_emoji(item["caption"]["text"]), link_url: item["link"]).first_or_create
      unless c.image?
        c.remote_image_url = item["images"]["standard_resolution"]["url"]
        c.save
      end
    end
  rescue
  #
  end
 
end


