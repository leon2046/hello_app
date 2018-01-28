class AddUserIdColumn < ActiveRecord::Migration[5.1]
  def change

    add_column :goods, :owner_user_id, :integer,  after: :image_path
    add_column :customers, :owner_user_id, :integer, after: :note
    add_column :orders, :owner_user_id, :integer, after: :status
    add_column :order_details, :owner_user_id, :integer, after: :order_note
    add_column :payments, :owner_user_id, :integer, after: :note
    add_column :rates, :owner_user_id, :integer, after: :apply_end_date

    add_index :goods, :owner_user_id
    add_index :customers, :owner_user_id
    add_index :orders, :owner_user_id
    add_index :order_details, :owner_user_id
    add_index :payments, :owner_user_id
    add_index :rates, :owner_user_id
  end
end
