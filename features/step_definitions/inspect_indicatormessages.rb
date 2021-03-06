require 'date'

Given("I check for the all the valid and expiry dates") do

 @browser.goto 'https://playground.riskmethods.net/admins/indicator_messages?data_source_id=5&valid_only=1'
 @browser.select_list(name:"data_source_id").select_value("All Data Sources")
 sleep 3
 @browser.button(name: "commit").click
 @browser.element(title: "Overwrite Validity Date").click
 today_date = Date.today 
 @browser.text_field(name: "indicator_message_validity[valid_until]").set today_date
 @browser.button(value: "Ok").click
 sleep 3
 puts Date.today
 table_text = Date.parse(@browser.table[1][12].text)
 puts table_text
if (today_date <= table_text)
	puts "valid"
else
    puts "invalid" 
    sleep 10
end
end


Given("I change the date one of the IM to todays date annd filter it") do
  today_date = Date.today 
  @browser.element(title: "Overwrite Validity Date",:index => 1).click
  @browser.text_field(name: "indicator_message_validity[valid_until]").set today_date
  @browser.button(value: "Ok").click
  sleep 3
  @browser.select_list(name: "validity_scope").select_value("Expire today")
  @browser.button(name: "commit").click
  sleep 2
  table_text_one = Date.parse(@browser.table[1][12].text)
  table_text_two = Date.parse(@browser.table[2][12].text)
  if (today_date = table_text_two && table_text_two)
	puts "valid"
  else
    puts "invalid" 
    sleep 2
 end
end