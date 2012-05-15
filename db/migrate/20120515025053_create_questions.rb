class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.string :email
      t.boolean :is_private

      t.timestamps
    end
  end
end
