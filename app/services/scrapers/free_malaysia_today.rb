module Scrapers
  class FreeMalaysiaToday < ApplicationService
    def process
      begin
        html = open(website.link + category.name)
        doc = Nokogiri::HTML(html)
        doc.at_xpath('//div[contains(@class, "td_block_wrap")]').elements.each do |item|
          News.find_or_create_by(parse_item(item))
        end        
      rescue
      end
    end

    private

    def parse_item(item)
      news = {news_website: website, category: category}
      news[:title] = item.css("h3.entry-title")&.css("a")&.text&.squish
      news[:link] = item.css("h3.entry-title")&.at_css("a")&.css("@href")&.text&.squish
      news[:image] = item.css("div.td-module-thumb")&.css("a")&.css("@href")&.text&.squish
      news[:post_date] = item.css("span.td-post-date")&.css("time")&.text&.squish
      news
    end

  end
end