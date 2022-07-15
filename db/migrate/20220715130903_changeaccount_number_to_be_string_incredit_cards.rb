# frozen_string_literal: true

class ChangeaccountNumberToBeStringIncreditCards < ActiveRecord::Migration[7.0]
  def change
    change_column :credit_cards, :card_number, :string
  end
end
