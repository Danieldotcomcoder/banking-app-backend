# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.integer :age
      t.string :email
      t.string :password_digest
      t.string :occupation
      t.decimal :salary
      t.string :country
      t.text :address

      t.timestamps
    end
  end
end
