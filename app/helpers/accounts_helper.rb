module AccountsHelper 

    def self.account_number_generator(letter)
        time = Time.now
        letter + '-' + time.strftime("%d%m%Y") + '-' + rand(10000000..99999999).to_s
    end

end