class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text
      t.text :description
      t.integer :position

      t.timestamps
    end
  end
end
