Given("I go to admin page") do
  visit(LoginPage)
end

And("I login") do
  on(LoginPage).login_with('watir@internal.riskmethods.net', 'WaTiR1234!') 
end

Given("I am on admin page and inspect pagination") do
  @browser.windows.last.use
  @browser.goto 'https://playground.riskmethods.net/admins/countries'
  sleep 2
  @browser.link(:text =>"2").when_present.click
  sleep 2
  @browser.text.include?("Displaying 11 - 20").should == true
  size = @browser.elements(class:"country").size
  if size = 10 then puts 'pagination works' else puts 'pagination not working' end
  sleep 3
  @browser.link(rel:"next").when_present.click
  @browser.text.include?("Displaying 21 - 30").should == true
  @browser.li(class: "last").link(:href => /admins/).click
  @browser.text.include?("Displaying").should == true
  sleep 3
end

Given("I click on Indicator and show buttons") do
  @browser.windows.last.use
  @browser.link(title: "Indicator Message").click
  sleep 3
  @browser.windows.last.use
  @browser.goto 'https://playground.riskmethods.net/admins/countries'
  @browser.link(title: "Show").click
  sleep 2
  @browser.text.include?("insgesamt").should == true
end