class News < ApplicationRecord
  belongs_to :news_website
  belongs_to :category
end
