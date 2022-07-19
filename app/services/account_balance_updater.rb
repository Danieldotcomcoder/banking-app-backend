# frozen_string_literal: true

class AccountBalanceUpdater
  def call(*args)
   if args[2] != 'CreditCard'
     @account = Account.find_by(id: args[1])
     newbalance = @account.balance - args[0]
     if newbalance.negative?
       false
     else
       @account.update(balance: newbalance)
       true
     end
   end
   true
  end
  end

