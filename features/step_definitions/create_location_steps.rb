Given("I create new location with hotspot") do
  @browser.windows.last.use
  visit(CreateLocationPage)
  on(CreateLocationPage).hot_spot()
end

Given("I create new location as risk object") do
  @browser.windows.last.use
  visit(CreateLocationPage)
  on(CreateLocationPage).new_location("Orleansstrasse 4", "81669", "Munich")
end

Then("I should see {string}") do |string|
    expect(@browser.text).to include "Risk Object created."
end