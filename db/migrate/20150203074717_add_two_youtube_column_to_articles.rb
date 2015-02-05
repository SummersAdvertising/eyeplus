class AddTwoYoutubeColumnToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :video_iframe_1, :text
    add_column :articles, :video_iframe_2, :text
  end
end
