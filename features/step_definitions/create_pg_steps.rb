 Given("I am on the pg page") do
  @browser.windows.last.use
  @browser.goto 'https://playground.riskmethods.net/product_groups' 
  @browser.driver.execute_script( "window.scrollBy(0,document.body.scrollHeight)" )
  sleep 5
  #@browser.element(:xpath =>"//*[@id='product-groups-root']/div/div[2]/form/a").click 
end

When("I create new pg and I edit existed pg") do
  @browser.text_field(type:"text").set('Sprint 0 PG')
  @browser.text_field(type:"text",:index => 1).set('SP 0')
  @browser.element(class: "btn-primary").click
  sleep 3
  @browser.element(class: "rst__rowWrapper",:index => 1).hover 
  @browser.element(class: "tree__editIcon___3xKWK",:index => 1).click
  sleep 2
  @browser.text_field(type:"text").set('Produktgruppe 3 (TOP)')
  @browser.text_field(type:"text",:index => 1).set('PG 3 (TOP)')
  @browser.element(class: "btn-primary").click
end

When("I create again new pg and drag and drop") do
  #@browser.refresh
  #@browser.element(:xpath =>"//*[@id='product-groups-root']/div/div[2]/form/a").click 
  #@browser.text_field(type:"text").set('Produktgruppe 3 (SUB)')
  #@browser.text_field(type:"text",:index => 1).set('PG 3 (SUB)')
  #@browser.element(class: "btn-primary").click
  @browser.driver.execute_script( "window.scrollBy(0,document.body.scrollHeight)" )
  sleep 5
end

Then("I search for {string}, {string} and {string}") do |string, string2, string3|
  
end