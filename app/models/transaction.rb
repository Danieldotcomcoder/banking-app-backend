# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :account
  has_one :payment

  validates :transaction_type, presence: true
  validates :total_amount, presence: true
end
