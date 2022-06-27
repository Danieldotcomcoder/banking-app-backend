# frozen_string_literal: true

module AccountsHelper
  def self.account_number_generator(letter)
    time = Time.now
    "#{letter}-#{time.strftime('%d%m%Y')}-#{rand(10_000_000..99_999_999)}"
  end

  def self.account_type_checker(type)
    if ['Checking', 'Savings', 'Money Market', 'Certificate of Deposit', 'Retirement'].include?(type)
      true
    else
      false
    end
  end
end
