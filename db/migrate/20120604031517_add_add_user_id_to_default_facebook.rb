class AddAddUserIdToDefaultFacebook < ActiveRecord::Migration
  def self.up
    add_column :default_facebooks, :user_id, :integer
  end

  def self.down
    remove_column :default_facebooks, :user_id
  end
end
