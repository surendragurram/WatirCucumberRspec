Given("I am on the pg page") do     
  @browser.windows.last.use
  @browser.goto'https://playground.riskmethods.net/product_groups'       
  sleep 3
  button = @browser.elements(class: "rst__rowWrapper",:index => 10) 
  @browser.execute_script('arguments[0].scrollIntoView();', button)    
  sleep 2    
end

