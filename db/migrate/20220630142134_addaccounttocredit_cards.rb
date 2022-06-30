# frozen_string_literal: true

class AddaccounttocreditCards < ActiveRecord::Migration[7.0]
  def change
    add_reference :credit_cards, :account, null: false, foreign_key: true
  end
end
