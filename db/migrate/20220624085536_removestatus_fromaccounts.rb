class RemovestatusFromaccounts < ActiveRecord::Migration[7.0]
  def change
    remove_column :accounts, :status
  end
end
