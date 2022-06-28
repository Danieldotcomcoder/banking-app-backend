class CreateCashes < ActiveRecord::Migration[7.0]
  def change
    create_table :cashes do |t|
      t.string :cash_name
      t.decimal :cash_amount
      t.timestamps

      t.references :payment, null: false, foreign_key: true
    end
  end
end
