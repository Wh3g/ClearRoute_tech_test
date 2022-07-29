require "customer_search"

describe CustomerSearch do
    describe "#customers" do
        it "imports latest-customers.txt" do
            expect(subject.customers.first).to eq({ 
            name: "Kirestin Delaney", 
            age: 22, 
            address: "464-7197 Ultricies Ave", 
            phone: "0800 326358", 
            email: "orci.lobortis@icloud.org"})
        end
    end

    describe "#search_age" do
        it "searches customers in age range" do
            expect(subject.search_age(40, 59).first).to eq({
            name: "Macey Bernard", 
            age: 54, 
            address: "Ap #617-9273 Donec St.", 
            phone: "(0118) 830 5233", 
            email: "arcu.iaculis.enim@outlook.edu"
            })
        end
    end
end