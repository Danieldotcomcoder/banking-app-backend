class RemoveaccountIdFromtransactions < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :account_id
  end
end
