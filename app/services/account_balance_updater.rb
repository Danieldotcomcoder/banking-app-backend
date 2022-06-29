# frozen_string_literal: true

class AccountBalanceUpdater
  def call(*args)
    @account = Account.find_by(id: args[1])
    newbalance = @account.balance - args[0]
    if(newbalance < 0) {
      return false
    } else {
      @account.update(balance: newbalance)
      return true
    }
  end
end
