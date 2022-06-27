# frozen_string_literal: true

class AccountBalanceUpdater
  def call(*args)
    @account = Account.find_by(id: args[1])
    oldbalance = @account.balance - args[0]
    @account.update(balance: oldbalance)
  end
end
