class CustomerSearch
    attr_reader :customers

    def initialize
        @customers = []
        import_customers
        
    end

    def import_customers
        file_data = File.read("./latest-customers.txt").split("\n")
        file_data.shift
        file_data.each do | customer |
            customer_data = customer.split(",")
            @customers << {
                name: customer_data[0], 
                age: customer_data[1].to_i, 
                address: customer_data[2], 
                phone: customer_data[3], 
                email: customer_data[4], 
            }
        end
    end

    def search_age(min, max)
        @customers.select { | customer | customer[:age] >= min && customer[:age] <= max}
    end
end