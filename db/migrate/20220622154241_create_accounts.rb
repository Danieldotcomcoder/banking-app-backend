class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :type
      t.integer :number
      t.integer :pin
      t.string :status

      t.timestamps
    end
  end
end
