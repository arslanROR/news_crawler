class NewsWebsite < ApplicationRecord
  has_many :categories, dependent: :destroy
end
