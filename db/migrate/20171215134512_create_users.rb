class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, primary_key: "user_id" do |t|
      t.string :account
      t.string :password

      t.timestamps
    end
  end
end
