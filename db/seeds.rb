# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



NEWS_WEBSITES_AND_CATEGORIES = [
  {
    website: {
      name: 'SAYS', 
      link: 'https://says.com/', 
      categories: [
        'news', 
        'tech', 
        'entertainment', 
        'lifestyle'
      ]
    },
  },
  {
    website: {
      name: 'Free Malaysia Today', 
      link: 'https://www.freemalaysiatoday.com/category/category/', 
      categories: [
        'leisure/food/', 
        'leisure/entertainment/', 
        'sports/football/'
      ]
    },
  },
  {
    website: {
      name: 'The Rakyat Post', 
      link: 'https://www.therakyatpost.com/category/', 
      categories: [
        'news', 
        'tech', 
        'fun', 
        'living'
      ]
    },
  },
]

NEWS_WEBSITES_AND_CATEGORIES.each do |item|
  item.each do |key, data|
    website_data = { name: data[:name], link: data[:link] }
    website = NewsWebsite.find_or_create_by(website_data)
    data[:categories].each do |category|
      website.categories.find_or_create_by(name: category)
    end
  end
end
