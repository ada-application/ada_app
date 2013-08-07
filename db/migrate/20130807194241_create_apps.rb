class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.boolean :accepted
      t.integer :score
      t.integer :reviewer_id
      t.boolean :rejected

      t.timestamps
    end
  end
end
