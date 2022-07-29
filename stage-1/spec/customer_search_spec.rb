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
end