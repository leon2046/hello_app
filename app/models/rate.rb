class Rate < ApplicationRecord

  def self.current_rate
    Rate.where("rates.apply_start_date <= ? and (rates.apply_end_date >= ? or rates.apply_end_date is null)", Date.today, Date.today)
  end
end
