class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.float :rate
      t.date :apply_start_date
      t.date :apply_end_date

      t.timestamps
    end
  end
end
