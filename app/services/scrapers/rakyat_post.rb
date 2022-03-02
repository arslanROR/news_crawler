module Scrapers
  class RakyatPost < ApplicationService
    def process
      begin
        html = open(website.link + category.name)
        doc = Nokogiri::HTML(html)
        doc.at_xpath('//div[contains(@class, "archive-pagination-container")]').elements.each do |item|
          News.find_or_create_by(parse_item(item)) rescue ''
        end        
      rescue
      end
    end

    private

    def parse_item(item)
      news = {news_website: website, category: category}
      news[:title] = item.css("div.post-title")&.css("a")&.text&.squish
      news[:author] = item.css("aside div.post-author a")&.text&.squish
      news[:link] = item.css("figure")&.at_css("a")&.css("@href")&.text&.squish
      news[:image] = item.css("figure a")&.css("img @src")&.text&.squish
      news[:post_date] = item.css("aside")&.css("ul li.post-date")&.text&.squish
      news
    end

  end
end