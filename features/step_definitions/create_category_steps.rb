Given("I am on the category page") do
  @browser.windows.last.use
  @browser.goto 'https://playground.riskmethods.net/material_groups' 
  @browser.element(:xpath =>"//*[@id='material-groups-root']/div/div[2]/form/a").click 
end

Given("I create new and edit category") do
  on(CreateCategoryPage).populate_data('Sprint 0 C', 'SP 0', 'Sprint 0 CC', 'SP 0 CC')
end

Then("I should see edited category {string}") do |string|
  sleep 5
  expect(@browser.text).to include string
end