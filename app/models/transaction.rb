# frozen_string_literal: true

class Transaction < ApplicationRecord
    belongs_to :account
    
    validates :transaction_type, presence: true
    validates :total_amount, presence: true
    
end
