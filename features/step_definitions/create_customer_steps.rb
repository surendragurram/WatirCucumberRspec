Given("I create Customer with Name, Address, Zip, City, Country") do
   @browser.windows.last.use
   @browser.goto 'https://playground.riskmethods.net/risk_object/debitors/new'
   on(CreateCustomerPage).populate_data("Kunde qm41 manuell", "Via di Acqua Bullicante", "Roma", "00177")
end

When("I select Customer catgories, pg and bu") do
   on(CreateCustomerPage).catgories_pg_bu()
   save_supplier
end

Then("I should have {string}") do |string|
 expect(@browser.text).to include "Risk Object created."
end
