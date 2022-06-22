# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :type
      t.integer :number
      t.string :password
      t.string :status

      t.timestamps
    end
  end
end
