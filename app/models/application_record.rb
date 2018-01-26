class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.create_conditions(params = {})
    conditions = nil
    params.each do |key, val|
      if conditions.present?
        conditions = conditions.and(arel_table[key].eq(val)) if !val.to_s.empty?
      else
        conditions = arel_table[key].eq(val) if !val.to_s.empty?
      end
    end
    return conditions
  end

  def date_valid?(str, presence = false)
    unless (!presence && (str.nil? || str.empty?))
      !! Date.parse(str) rescue false
    end
  end
end
