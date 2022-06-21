class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.integer :age
      t.decimal :salary
      t.string :occupation
      t.string :country
      t.text :address

      t.timestamps
    end
  end
end
