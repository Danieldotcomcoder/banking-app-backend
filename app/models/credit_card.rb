# frozen_string_literal: true

class CreditCard < ApplicationRecord
  belongs_to :payment
end
