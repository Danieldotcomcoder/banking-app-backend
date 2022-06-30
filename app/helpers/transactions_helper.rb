# frozen_string_literal: true

module TransactionsHelper
  def transaction_type_controller(payment)
    case payment.payment_type

    when 'Cash'
      Cash.create(cash_amount: payment.amount, payment_id: payment.id)

    when 'CreditCard'

    else
      puts 'Invalid Transaction Type'
    end
  end


  def check_credit_card(account_id)
    @creditcard = CreditCard.find_by(account_id: account_id)
    

  end
end
