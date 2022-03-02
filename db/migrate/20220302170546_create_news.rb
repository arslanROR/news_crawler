class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.references :news_website, foreign_key: true
      t.references :category, foreign_key: true
      t.string :title
      t.string :description
      t.string :author
      t.string :link
      t.string :image
      t.string :post_date

      t.timestamps
    end
  end
end
