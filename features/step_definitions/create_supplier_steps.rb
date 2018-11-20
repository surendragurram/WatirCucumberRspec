Given("I am on the admin page") do
  visit(LoginPage)
end

And("I have admin access") do
  on(LoginPage).login_with('watir@internal.riskmethods.net', 'WaTiR1234!') 
end

And("I am on the admin page and impersonate the customer") do
	visit(AccountPage)
  on(AccountPage).search_for_customer('automated testing42') 
end

And("I create Supplier with Name, Address, Zip, City, Country") do
  @browser.windows.last.use
  visit(CreateSupplierPage)
  on(CreateSupplierPage).populate_data("Lieferant qm41 manuell", "Portugal")
end

And("on, off and agin manual geo coding") do
  on(CreateSupplierPage).geo_coder()
end

 When("I select catgories, pg and bu") do
  on(CreateSupplierPage).attributes()
end

Then("I should see {string}") do |string|
    expect(@browser.text).to include "Risk Object created."
end
