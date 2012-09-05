class AddIsDisplayToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :is_display, :boolean, default: false
  end
end
