class AddTopToArticle < ActiveRecord::Migration
  def change
  	add_column :articles, :top, :string
  end
end
