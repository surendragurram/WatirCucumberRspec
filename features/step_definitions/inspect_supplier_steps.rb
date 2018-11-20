Given("I am on admin page and inspect pagination of supplier + cutomer") do
  @browser.windows.last.use
  @browser.goto 'https://playground.riskmethods.net/admins/business_partners'
  @browser.driver.execute_script("window.scrollBy(0,document.body.scrollHeight)")
  @browser.link(:text =>"2").when_present.click
  @browser.text.include?("Displaying 11 - 20").should == true
  @browser.link(rel:"next").when_present.click
  @browser.text.include?("Displaying 21 - 30").should == true
  @browser.driver.execute_script("window.scrollBy(0,document.body.scrollHeight)")
  #@browser.a(:href => /admins/).wait_until_present.click
  @browser.li(class: "last").link(:href => /admins/).click
  @browser.text.include?("Displaying").should == true
end	


Given("I search for the supplier and create IM") do
  @browser.text_field(name:"query").set('qm41 manuell')
  @browser.button(name:"commit").click
  @browser.element(title: "Indicator Message",:index => 4).click
  @browser.windows.last.use
  @browser.text_field(name:"indicator_message_form_object[subject]").set('Automated Subject')
  @browser.text_field(name:"indicator_message_form_object[source_in_body]").set('Automated Source in Body Text')
  @browser.text_field(name:"indicator_message_form_object[source_for_copyright]").set('Automated Source for copyright')
  @browser.text_field(name:"indicator_message_form_object[hyperlink]").set('https://playground.riskmethods.net/admins')
  @browser.textarea(name:"indicator_message_form_object[content]").set('Automated Content')
  @browser.element(class:"ui-state-default").click
  #browser.driver.action.move_to(class: "ui-state-defaul.wd", 30, 0).click.perform
  sleep 5
  @browser.text_field(name:"indicator_message_form_object[valid_until]").set('31.10.2017')
  parent_class = "indicator_message_form_object_indicator_id"
    drop_down_button = @browser.element(class: parent_class).divs(class: 'controls').first.spans.first
    drop_down_button.click
    xpath_element(parent_class: 'select2-container--open', child_class: 'select2-search__field').to_subtype.set('Bankruptcy')
    @browser.element(class: 'select2-results__option--highlighted').click
  sleep 3
  #@browser.button(name:"commit").click
 end

Given("I click on show button and check duns") do
  @browser.goto 'https://playground.riskmethods.net/admins/business_partners'
  @browser.text_field(name:"query").set('qm41 manuell')
  @browser.button(name:"commit").click
  @browser.element(title: "Show",:index => 4).click
  #@browser.text.include?("Business Partners with the same DUNS").should == true
  expect(@browser.text).to include "Business Partners with the same DUNS", "Indicators", "Last message", "Lieferant qm41 manuell"
  sleep 5
end

Given("I edit serch name") do
  @browser.goto 'https://playground.riskmethods.net/admins/business_partners'
  @browser.text_field(name:"query").set('qm41 manuell')
  @browser.button(name:"commit").click
  @browser.element(title: "Edit").click
  @browser.text_field(name:"admins_debitors_grouped_by_duns_form_object[search_name]").set('Eff. Suchname')
  @browser.button(name:"commit").click
  @browser.goto 'https://playground.riskmethods.net/admins/business_partners'
  @browser.text_field(name:"query").set('Eff. Suchname')
  @browser.button(name:"commit").click
  expect(@browser.text).to include "rm-012-9102"
  sleep 5
end

def xpath_element(parent_class:, child_class:)
   @browser.element(xpath: "//span[contains(concat(' ', normalize-space(@class), ' '), concat(' ', '#{parent_class}', ' '))]//input[@class='#{child_class}']")
end