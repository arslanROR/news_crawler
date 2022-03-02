class ApplicationService
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

end