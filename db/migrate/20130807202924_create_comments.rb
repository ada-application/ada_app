class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :app_id
      t.text :comment_text

      t.timestamps
    end
  end
end
