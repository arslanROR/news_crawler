class Crawler

  class << self
    def call
      new().process
    end
  end

  def initialize()
    # if there are some params than initialize here
  end

  def process
    puts "Start Crawling"

    website = NewsWebsite.first
    website.categories.map(&:name).each do |category|
      ScrapeCategory.call(website, category)
      puts "Pass One Category"
    end

  end


end