class AddUserNameToQuestion < ActiveRecord::Migration
  def self.up
    add_column :questions, :user_name, :string
  end

  def self.down
    remove_column :questions, :user_name
  end
end
