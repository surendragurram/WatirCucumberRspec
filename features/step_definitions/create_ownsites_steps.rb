Given("I create new location with Own site") do
  @browser.windows.last.use
  visit(CreateOwnsitePage)
  on(CreateOwnsitePage).own_site('Standort qm41 manuell', '00177', 'x', 'Cairns')
end

Then("I should see {string}") do |string|
    expect(@browser.text).to include "Risk Object created."
end
