class CreateGoods < ActiveRecord::Migration[5.1]
  def change
    create_table :goods do |t|
      t.string :jan_cd, limit: 13
      t.string :name_jp
      t.string :name_cn
      t.integer :price_jpy
      t.integer :profit_rate
      t.string :image_path

      t.timestamps
    end
  end
end
