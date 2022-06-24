# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true
  validates :account_type, presence: true
  validates :pin, presence: true

end
