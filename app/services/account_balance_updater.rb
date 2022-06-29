# frozen_string_literal: true

class AccountBalanceUpdater
  def call(*args)
    @account = Account.find_by(id: args[1])
    newbalance = @account.balance - args[0]
    if newbalance.negative?
      false
    else
      @account.update(balance: newbalance)
      true
    end
  end
end
