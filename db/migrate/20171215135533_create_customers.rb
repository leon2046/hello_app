class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers, primary_key: "customer_id" do |t|
      t.string :name
      t.string :snsid
      t.string :note

      t.timestamps
    end
  end
end
