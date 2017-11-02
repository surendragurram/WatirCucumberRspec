Given("I am on world map and search {string}, {string}, {string} , {string} ,  {string}") do |string, string2, string3, string4, string5|
  @browser.windows.last.use
  @browser.text.include?(string).should == true
  @browser.text.include?(string2).should == true
  @browser.text.include?(string3).should == true
  @browser.text.include?(string4).should == true
  @browser.text.include?(string5).should == true
end 