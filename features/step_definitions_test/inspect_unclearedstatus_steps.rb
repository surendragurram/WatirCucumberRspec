Given("I check for uncleared and cleared status of suppliers and customers") do
  @browser.goto 'https://playground.riskmethods.net/admins/business_partners'
  sleep 2
  @browser.checkbox(name:"uncleared_only").set
  @browser.button(name:"commit").click
  sleep 6
  #@browser.text.include?("3 B -Business-Beteiligungsgesellschaft Bergneustadt Mbh & Co. Kg").should == false
  #@browser.radio(:name => 'checked', :value => 'checked').checked?
 if @browser.checkbox(:id => "cleared_supplier_ids_" && "cleared_debitor_ids_").set? == true 
 	puts "checked"
 else
  	puts "unchecked" 
  end
end

Given("Save the Placement report in drop box") do
  @browser.goto 'https://playground.riskmethods.net/admins/on_boarding/placement_report/new'
  parent_class = "placement_report_form_customer_id"
  drop_down_button = @browser.element(class: parent_class).divs(class: 'controls').first.spans.first
  drop_down_button.click
  xpath_element(parent_class: 'select2-container--open', child_class: 'select2-search__field').to_subtype.set('Automated Testing42')
  @browser.element(class: 'select2-results__option--highlighted').click
  @browser.button(name:"commit").click
  expect(@browser.text).to include "The placement report will be generated and sent to you by mail."
end

def xpath_element(parent_class:, child_class:)
   @browser.element(xpath: "//span[contains(concat(' ', normalize-space(@class), ' '), concat(' ', '#{parent_class}', ' '))]//input[@class='#{child_class}']")
end