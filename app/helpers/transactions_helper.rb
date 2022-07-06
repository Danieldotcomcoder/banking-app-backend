# frozen_string_literal: true

module TransactionsHelper
  def transaction_type_controller(payment)
    case payment.payment_type

    when 'Cash'
      Cash.create(cash_amount: payment.amount, payment_id: payment.id)
      true
    when 'CreditCard'
      if check_credit_card(payment.account_id) == true
        @creditcard = CreditCard.find_by(account_id: payment.account_id)
        newbalance = @creditcard.card_balance - payment.amount
        @creditcard.update(card_balance: newbalance)
        true
      else
        false
      end

    end
  end

  def check_credit_card(accid)
    if CreditCard.find_by(account_id: accid).nil?
      false
    else
      true

    end
  end
end
