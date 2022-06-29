# frozen_string_literal: true

module PaymentsHelper
  def payment_type_checker(paymenttype)
    if %w[Cash CreditCard Cheque].include?(paymenttype)
      true
    else
      false
    end
  end
end
