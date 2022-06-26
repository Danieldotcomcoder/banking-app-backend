# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :currency
      t.decimal :amount
      t.string :payment_type
      t.string :payment_address

      t.timestamps
    end
    add_reference :payments, :account, null: false, foreign_key: true
  end
end
