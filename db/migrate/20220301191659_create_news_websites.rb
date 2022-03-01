class CreateNewsWebsites < ActiveRecord::Migration[5.2]
  def change
    create_table :news_websites do |t|
      t.string :name
      t.string :link

      t.timestamps
    end
  end
end
