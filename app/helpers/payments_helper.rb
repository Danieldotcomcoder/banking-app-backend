# frozen_string_literal: true

module PaymentsHelper
  def self.payment_type_checker(type)
    if ['Cash', 'CreditCard', 'Cheque'].include?(type)
      true
    else
      false
    end
  end
end
