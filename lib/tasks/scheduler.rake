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

  # twitter
  # start with Twitter
  now = Time.now.to_i
  twitter_client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
    config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET'] 
    config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
    config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
  end  

      
  begin
    tweets = twitter_client.user_timeline("supermarketart")
    tweets.each do |tweet|
      Cash.where(source: 'twitter',  issued_at: tweet.created_at.to_i, sourceid: tweet.id, title: tweet.text, 
                 content: tweet.text, link_url: tweet.uri.to_s).first_or_create
    end

  rescue Twitter::Error::NotFound
    # do nothing if twitter isn't connecting
  end  



  # instagram ?
  
  require 'open-uri'
  require 'json'
  remove_emojis = /[\u{1F600}-\u{1F6FF}]/
  


  begin
    instagram = JSON.parse(open("https://www.instagram.com/supermarketart/?__a=1").read)
    instagram['graphql']['user']['edge_owner_to_timeline_media']['edges'].each_with_index do |item, index|
      c = Cash.where(source: 'instagram',  
        issued_at: item['node']["taken_at_timestamp"], 
        sourceid: item['node']["id"], 
        title: strip_emoji(item["node"]["edge_media_to_caption"]['edges'][0]['node']['text']), 
        link_url: "https://www.instagram.com/p/#{item['node']['shortcode']}/?taken-by=supermarketart").first_or_create
      unless c.image?
        c.remote_image_url = item["node"]["display_url"]
        c.save
      end

    end
  rescue
    
  end
 
end


