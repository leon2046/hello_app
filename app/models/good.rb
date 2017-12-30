class Good < ApplicationRecord

  scope :goodsNameLike, ->(keyword) {
    where("name_jp LIKE ? or name_cn LIKE ?", "%" + sanitize_sql_like(keyword) + "%", "%" + sanitize_sql_like(keyword) + "%")
  }
end
