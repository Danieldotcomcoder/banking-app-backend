# frozen_string_literal: true

module CreditCardsHelper
  require 'date'
  def credit_card_16_d_number_generator
    "#{rand(1000..9999)}_#{rand(1000..9999)}_#{rand(1000..9999)}_#{rand(1000..9999)}"
  end

  def credit_card_cvv
    rand(100..999)
  end

  def credit_card_expiry_date
    DateTime.now.next_year(5).to_time
  end
end
