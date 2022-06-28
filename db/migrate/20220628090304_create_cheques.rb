class CreateCheques < ActiveRecord::Migration[7.0]
  def change
    create_table :cheques do |t|
      t.integer :cheque_number
      t.string :cheque_bank
      t.string :cheque_name
      t.decimal :cheque_amount

      t.timestamps
      t.references :payment, null: false, foreign_key: true
    end
  end
end
