# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_220_705_112_144) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'accounts', force: :cascade do |t|
    t.string 'name'
    t.string 'account_type'
    t.string 'number'
    t.integer 'pin'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id', null: false
    t.boolean 'status', default: true
    t.decimal 'balance'
    t.index ['user_id'], name: 'index_accounts_on_user_id'
  end

  create_table 'cashes', force: :cascade do |t|
    t.string 'cash_name'
    t.decimal 'cash_amount'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'payment_id', null: false
    t.index ['payment_id'], name: 'index_cashes_on_payment_id'
  end

  create_table 'cheques', force: :cascade do |t|
    t.integer 'cheque_number'
    t.string 'cheque_bank'
    t.string 'cheque_name'
    t.decimal 'cheque_amount'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'payment_id', null: false
    t.index ['payment_id'], name: 'index_cheques_on_payment_id'
  end

  create_table 'credit_cards', force: :cascade do |t|
    t.string 'cardholder_name'
    t.integer 'card_number'
    t.integer 'card_cvv'
    t.date 'card_expiry_date'
    t.decimal 'card_balance'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'account_id', null: false
    t.index ['account_id'], name: 'index_credit_cards_on_account_id'
  end

  create_table 'payments', force: :cascade do |t|
    t.string 'currency'
    t.decimal 'amount'
    t.string 'payment_type'
    t.string 'payment_address'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'account_id'
    t.index ['account_id'], name: 'index_payments_on_account_id'
  end

  create_table 'transactions', force: :cascade do |t|
    t.string 'transaction_type', null: false
    t.string 'bank_name'
    t.decimal 'debit', default: '0.0'
    t.decimal 'credit', default: '0.0'
    t.decimal 'total_amount'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'account_id', null: false
    t.bigint 'payment_id', null: false
    t.index ['account_id'], name: 'index_transactions_on_account_id'
    t.index ['payment_id'], name: 'index_transactions_on_payment_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'firstname'
    t.string 'lastname'
    t.integer 'age'
    t.string 'email'
    t.string 'password_digest'
    t.string 'occupation'
    t.decimal 'salary'
    t.string 'country'
    t.text 'address'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'accounts', 'users'
  add_foreign_key 'cashes', 'payments'
  add_foreign_key 'cheques', 'payments'
  add_foreign_key 'credit_cards', 'accounts'
  add_foreign_key 'payments', 'accounts'
  add_foreign_key 'transactions', 'accounts'
  add_foreign_key 'transactions', 'payments'
end
