# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :transaction_type
      t.string :bank_name
      t.decimal :debit
      t.decimal :credit
      t.decimal :total_amount

      t.timestamps
    end
  end
end
