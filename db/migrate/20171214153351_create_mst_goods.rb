class CreateMstGoods < ActiveRecord::Migration[5.1]
  def change
    create_table :mst_goods, primary_key: 'good_id' do |t|
#      t.string :good_id, limit: 13
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
