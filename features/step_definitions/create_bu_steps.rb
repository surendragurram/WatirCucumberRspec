Given("I am on the BU page") do
  @browser.windows.last.use
  @browser.goto 'https://playground.riskmethods.net/business_units' 
end

When("I create new BU") do
  @browser.element(:xpath =>"//*[@id='business-units-root']/div/div[2]/form/a").click 
  on(CreateBUPage).business_unit('Sprint 01 A', 'SP 0')
end

Then("I should see created {string}") do |string|
  sleep 5
  expect(@browser.text).to include string
end

'text for commit'