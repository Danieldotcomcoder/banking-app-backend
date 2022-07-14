# frozen_string_literal: true

module CreditCardsHelper
  require 'date'
  def credit_card_16_d_number_generator
    "#{rand(1000..9999)}_#{rand(1000..9999)}_#{rand(1000..9999)}_#{rand(1000..9999)}"
  end

  def credit_card_cvv
    rand(100..999).to_s
  end

  def self.created_card_expiry_date
    time = DateTime.now.next_year(5).to_time.strftime('%Y-%m')
  end
end

CreditCardsHelper.created_card_expiry_date
