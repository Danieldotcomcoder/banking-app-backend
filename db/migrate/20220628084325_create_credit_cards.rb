# frozen_string_literal: true

class CreateCreditCards < ActiveRecord::Migration[7.0]
  def change
    create_table :credit_cards do |t|
      t.string :cardholder_name
      t.integer :card_number
      t.integer :card_cvv
      t.date :card_expiry_date
      t.decimal :card_balance

      t.timestamps
      t.references :payment, null: false, foreign_key: true
    end
  end
end
