# frozen_string_literal: true

class AddBalanceToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :balance, :decimal
  end
end
