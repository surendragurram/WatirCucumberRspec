Given("I check for uncleared and cleared status of suppliers and customers") do
  @browser.goto 'https://playground.riskmethods.net/admins/business_partners'
  sleep 2
  @browser.checkbox(name:"uncleared_only").set
  @browser.button(name:"commit").click
  sleep 3
  #@browser.text.include?("3 B -Business-Beteiligungsgesellschaft Bergneustadt Mbh & Co. Kg").should == false
  #@browser.radio(:name => 'checked', :value => 'checked').checked?
 if @browser.checkbox(:id => "cleared_supplier_ids_").set? == true
 	puts "checked"
 else
  	puts "unchecked" 
  end
end

Given("Save the Placement report in drop box") do
  
end