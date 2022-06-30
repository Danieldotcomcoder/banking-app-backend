# frozen_string_literal: true

module TransactionsHelper
  def transaction_type_controller(payment)
    case payment.payment_type

    when 'Cash'
      Cash.create(cash_amount: payment.amount, payment_id: payment.id)
    else
      puts 'Invalid Transaction Type'
    end
  end
end
