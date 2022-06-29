# frozen_string_literal: true

class Cheque < ApplicationRecord
  belongs_to :payment
end
