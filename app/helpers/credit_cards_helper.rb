# frozen_string_literal: true

module CreditCardsHelper
    require 'date'
    def credit_card_16_d_number_generator
       "#{rand(1000..9999)}_#{rand(1000..9999)}_#{rand(1000..9999)}_#{rand(1000..9999)}"
    end

    def credit_card_cvv
       "#{rand(100..999)}"
    end

    def self.created_card_expiry_date
        time = Time.now
       x = Date.new(time.strftime('%Y,%M,%D')).next_year(1)
       puts x
        # puts "#{time.strftime('%m/ %Y')}"
    end
end

CreditCardsHelper.created_card_expiry_date