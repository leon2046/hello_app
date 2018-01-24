class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.create_conditions(params = {})
    conditions = nil
    params.each do |key, val|
      if conditions.present?
        conditions = conditions.and(arel_table[key].eq(val)) if !val.empty?
      else
        conditions = arel_table[key].eq(val) if !val.empty?
      end
    end
    return conditions
  end
end
