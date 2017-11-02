Given("I am on the BU page and search for {string}, {string}, {string}, {string} and {string}") do |string, string2, string3, string4, string5|
  @browser.windows.last.use
  visit(SearchBuPage)
  on(SearchBuPage).search_bu(string, string2, string3, string4, string5)
end

Then("I see the related search results") do
  pending # Write code here that turns the phrase above into concrete actions
end  