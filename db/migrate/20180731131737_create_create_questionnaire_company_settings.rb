class CreateCreateQuestionnaireCompanySettings < ActiveRecord::Migration[5.1]
  def change
    create_table :create_questionnaire_company_settings do |t|
      t.integer :company_pk

      t.timestamps
    end
  end
end
