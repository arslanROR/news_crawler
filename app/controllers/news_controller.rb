class NewsController < ApplicationController
  def index
  end

  def scrape
    Crawler.call
  end

end
