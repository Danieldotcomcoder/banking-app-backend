# frozen_string_literal: true

module CreditCardsHelper
  require 'date'
  def credit_card_16_d_number_generator
    "#{rand(1000..9999)}_#{rand(1000..9999)}_#{rand(1000..9999)}_#{rand(1000..9999)}"
  end

  def credit_card_cvv
    rand(100..999)
  end

  def credit_card_expiry_date
    DateTime.now.next_year(5).to_time
  end

  def credit_card_balance_initializer(params)
    acc_id = params[:account_id]
    @account = Account.find_by(id: acc_id)
    init_balance = params[:card_balance]
    if @account.balance < init_balance.to_i
      false
    else
      new_balance = @account.balance - init_balance.to_i
      @account.update(balance: new_balance)
      true
    end
  end
end
