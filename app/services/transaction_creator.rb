# frozen_string_literal: true

class TransactionCreator
  def call(params)
    @transaction = Transaction.create(params)
  end
end
