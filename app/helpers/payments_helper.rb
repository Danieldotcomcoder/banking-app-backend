# frozen_string_literal: true

module PaymentsHelper
  def self.payment_type_checker(type)
    if %w[Cash CreditCard Cheque].include?(type)
      true
    else
      false
    end
  end
end
