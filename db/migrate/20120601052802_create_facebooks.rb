class CreateFacebooks < ActiveRecord::Migration
  def change
    create_table :facebooks do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :site_type
      t.string :url
      t.string :site_name
      t.string :admins

      t.timestamps
    end
  end
end
