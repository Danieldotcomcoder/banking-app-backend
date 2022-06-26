# frozen_string_literal: true

class TransactionCreator
  def call(params)
    Transaction.create(params)
  end
end
