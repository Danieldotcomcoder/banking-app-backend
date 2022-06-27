# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :account, optional: true

  validates :currency, presence: true
  validates :amount, presence: true
  validates :payment_type, presence: true
end
