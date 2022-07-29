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
        search_results = @customers.select { | customer | customer[:age] >= min && customer[:age] <= max}
        write_file(search_results) 
        search_results       
    end

    def write_file(search_results)
        results_file = File.new("search_results.txt", "w")
        results_file.puts(format(search_results))
        results_file.close
    end

    def format(search_results)
        output = "name,age,address,phone,email\n"
        search_results.each do | customer |
            output << "#{customer[:name]},#{customer[:age]},#{customer[:address]},#{customer[:phone]},#{customer[:email]}\n"
        end
        output
    end
end