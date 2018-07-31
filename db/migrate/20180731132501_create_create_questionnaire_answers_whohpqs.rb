class CreateCreateQuestionnaireAnswersWhohpqs < ActiveRecord::Migration[5.1]
  def change
    create_table :create_questionnaire_answers_whohpqs do |t|
      t.integer :company_pk
      t.integer :user_pk
      t.integer :answer1
      t.integer :answer2
      t.integer :answer3
      t.timestamp :answered_at
      t.string :created_by

      t.timestamps
    end
  end
end
