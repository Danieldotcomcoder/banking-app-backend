# frozen_string_literal: true

class RemovepaymentIdFromcreditcards < ActiveRecord::Migration[7.0]
  def change
    remove_column :credit_cards, :payment_id
  end
end
