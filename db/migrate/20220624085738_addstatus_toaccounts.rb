# frozen_string_literal: true

class AddstatusToaccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :status, :boolean, default: true
  end
end
