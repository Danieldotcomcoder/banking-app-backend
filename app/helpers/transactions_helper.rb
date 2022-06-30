# frozen_string_literal: true

module TransactionsHelper
  def transaction_type_controller(transaction)
    case transaction.transaction_type

    when 'Cash'
      Cash.create(cash_amount: transaction.total_amount, payment_id: payment.id)
    # when 'CreditCard'
    #   if check_credit_card(payment.account_id) == true
    #     @creditcard = CreditCard.find_by(account_id: account_id)
    #     newbalance = @creditcard.card_balance - payment.amount
    #     if newbalance > 0
    #       @creditcard.update(card_balance: newbalance)
          
    else
      puts 'Invalid Transaction Type'
    end
  end


  # def check_credit_card(account_id)
  #    if CreditCard.find_by(account_id: account_id).nil? 
  #       render json: 'You dont have any credit cards yet , please request one'.to_json, status: :unprocessable_entity
  #       false
  #    else
  #     true
  # end
end
