# frozen_string_literal: true

class Cash < ApplicationRecord
  belongs_to :payment
end
