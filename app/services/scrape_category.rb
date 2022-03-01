class ScrapeCategory

  require 'nokogiri'
  require 'open-uri'

  attr_reader :website, :category

  class << self
    def call(website, category)
      new(website, category).process
    end
  end

  def initialize(website, category)
    @website = website
    @category = category
    # if there are some params than initialize here
  end

  def process

    puts "Start Scraping news of this category #{category}"

    html = open(website.link)
    doc = Nokogiri::HTML(html)

    doc.xpath('//ul[@class="list-unstyled news-feed-items index-load-more-container"]').each do |news_feed_items|
      news_feed_items.elements.each do |item|
        news = {}
        story_info = item.css(".story-info")
        story_cover_image = item.css(".story-cover-image")
        news_path_link = story_cover_image.css("a.ga-featured-story")[0]['href']
        news[:link] = "#{website.link}#{news_path_link}" 
        news[:image] = story_cover_image.css("div.story-image")[0].values[-1]
        news[:title] = story_info.css("p")&.text&.squish
        news[:desc] = story_info.css("p.story-desc")&.text&.squish
        news[:author] = story_info.css("p.story-author")&.text&.squish
        puts news
      end
    end
  end


end