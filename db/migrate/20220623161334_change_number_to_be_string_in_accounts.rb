class ChangeNumberToBeStringInAccounts < ActiveRecord::Migration[7.0]
  def change
    change_column :accounts, :number, :string
  end
end
