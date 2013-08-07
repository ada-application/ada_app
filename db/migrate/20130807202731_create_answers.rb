class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :applicant_id
      t.integer :question_id
      t.text :answer_text

      t.timestamps
    end
  end
end
