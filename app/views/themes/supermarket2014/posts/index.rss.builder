# frozen_string_literal: true

# index.rss.builder
xml.instruct! :xml, version: '1.0'
xml.rss version: '2.0' do
  xml.channel do
    xml.title 'Supermarket Art Fair'
    xml.description 'Stockholm Independent Art Fair, 14-16 February 2014'
    xml.link posts_url(format: :rss)

    @posts.each do |article|
      xml.item do
        xml.title article.subject
        xml.description article.body

        xml.pubDate article.published_at.to_s(:rfc822)
        xml.link post_url(article)
        xml.guid posts_url(format: :rss)
      end
    end
  end
end
