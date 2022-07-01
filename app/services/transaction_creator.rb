# frozen_string_literal: true

class TransactionCreator
  include TransactionsHelper
  
  def call(params)
   @transaction = Transaction.create(params)
   transaction_type_controller(@transaction)
  end
end
