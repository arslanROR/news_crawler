module Scrapers
  class Says < ApplicationService  
    def process
      begin
        html = open(website.link + category.name)
        doc = Nokogiri::HTML(html)
        doc.at_xpath('//ul[contains(@class, "news-feed")]').elements.each do |item|
          News.find_or_create_by(parse_item(item)) rescue ''
        end        
      rescue
      end
    end
  
    private
  
    def parse_item(item)
      news = {news_website: website, category: category}
      story_info = item.css(".story-info")
      story_cover_image = item.css(".story-cover-image")
      news_path_link = story_cover_image.at_css("a").css("@href")&.text&.squish
      news[:title] = story_info.css("p")&.text&.squish
      news[:description] = story_info.css("p.story-desc")&.text&.squish
      news[:author] = story_info.css("p.story-author").css("a")&.text&.squish
      news[:link] = "#{website.link}#{news_path_link}" 
      news[:image] = story_cover_image.css("div.story-image")[0].values[-1]
      news
    end
    
  end
end