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
    NewsWebsite.all.each do |website|
      case website.name # this switch statement is being used here because every website has different serviec for parsing the news
      when 'SAYS'
        website.categories.each do |category|
          Scrapers::Says.call(website, category)
        end
      when 'Free Malaysia Today'
        website.categories.each do |category|
          Scrapers::FreeMalaysiaToday.call(website, category)
        end
      when 'The Rakyat Post'
        website.categories.each do |category|
          Scrapers::RakyatPost.call(website, category)
        end
      end
    end
  end


end