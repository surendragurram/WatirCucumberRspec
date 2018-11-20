Given("I am on the categories and I search for {string}, {string}, {string} and {string}") do |string, string2, string3, string4|
  @browser.windows.last.use
  visit(SearchCategoryPage)
  on(SearchCategoryPage).search_category(string, string2, string3, string4)
end

Then("I see the related {string}") do |string|
  sleep 5
  expect(@browser.text).to include string
end  