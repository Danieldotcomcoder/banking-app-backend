# frozen_string_literal: true

module AccountsHelper
  def account_number_generator(acctype)
    time = Time.now
    "#{acctype[0, 1]}-#{time.strftime('%d%m%Y')}-#{rand(10_000_000..99_999_999)}"
  end

  def self.account_type_checker(type)
    if ['Checking', 'Savings', 'Money Market', 'Certificate of Deposit', 'Retirement'].include?(type)
      true
    else
      false
    end
  end
end
