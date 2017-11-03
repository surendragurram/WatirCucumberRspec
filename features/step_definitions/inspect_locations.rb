Given("I am on admin page and inspect pagination of location") do
  @browser.windows.last.use
  @browser.goto 'https://playground.riskmethods.net/admins/locations'
  sleep 2
  @browser.link(:text =>"2").when_present.click
  sleep 2
  @browser.text.include?("Displaying 11 - 20").should == true
  size = @browser.elements(class:"address").size
  if size = 7 then puts 'pagination works' else puts 'pagination not working' end
  sleep 3
  @browser.link(rel:"next").when_present.click
  @browser.text.include?("Displaying 21 - 30").should == true
  @browser.li(class: "last").link(:href => /admins/).click
  @browser.text.include?("Displaying").should == true
  sleep 3
end

Given("I click keyword export") do
 @browser.link(class:"btn-info").click
 sleep 3
 size = @browser.text.include?("OR").should == true
 sleep 3
end