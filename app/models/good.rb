class Good < ApplicationRecord
  validates :jan_cd, format: {with: /\A\z|\A[0-9]{13}\z/, multiline: false}
  validates :name_jp, length: {maximum: 255}, presence: true
  validates :name_cn, length: {maximum: 255}, presence: false
  validates :price_jpy, numericality: {only_integer: true}, presence: true
  validates :selling_price_cny, numericality: {greater_than: 0}, presence: true
  validates :profit_rate, numericality: {only_integer: true, greater_than: 0}, presence: true

  scope :goodsNameLike, ->(keyword) {
    where("name_jp LIKE ? or name_cn LIKE ?", "%" + sanitize_sql_like(keyword) + "%", "%" + sanitize_sql_like(keyword) + "%")
  }
end
