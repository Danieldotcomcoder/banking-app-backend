# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :transaction_type, null: false
      t.string :bank_name
      t.decimal :debit, default: 0.0
      t.decimal :credit, default: 0.0
      t.decimal :total_amount

      t.timestamps
    end
    add_reference :transactions, :account, null: false, foreign_key: true
  end
end
