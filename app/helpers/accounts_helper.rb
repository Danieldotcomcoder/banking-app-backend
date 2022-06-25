# frozen_string_literal: true

module AccountsHelper
  def self.account_number_generator(letter)
    time = Time.now
    "#{letter}-#{time.strftime('%d%m%Y')}-#{rand(10_000_000..99_999_999)}"
  end
end
