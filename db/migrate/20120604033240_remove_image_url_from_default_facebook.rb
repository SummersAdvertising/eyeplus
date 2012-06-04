class RemoveImageUrlFromDefaultFacebook < ActiveRecord::Migration
  def self.up    
    remove_column :default_facebooks, :image_url
  end

  def self.down
    add_column :default_facebooks, :image_url, :string
  end
end
