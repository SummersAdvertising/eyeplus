class AddExcerptImageBottomToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :excerpt_image_bottom_file_name,    :string
    add_column :articles, :excerpt_image_bottom_content_type, :string
    add_column :articles, :excerpt_image_bottom_file_size,    :integer
    add_column :articles, :excerpt_image_bottom_updated_at,   :datetime
  end

  def self.down
    remove_column :articles, :excerpt_image_bottom_file_name
    remove_column :articles, :excerpt_image_bottom_content_type
    remove_column :articles, :excerpt_image_bottom_file_size
    remove_column :articles, :excerpt_image_bottom_updated_at
  end
end
