class SearchBuPage
	include PageObject
	page_url 'https://playground.riskmethods.net/business_units' 

	text_field(:first, class: "search-field")
	text_field(:second, class: "search-field")
	text_field(:third, class: "search-field")
	text_field(:fourth, class: "search-field")
	text_field(:fifth, class: "search-field")
	
	def search_bu (first, second, third, fourth, fifth)
		@browser.element(class: "search-field").click 
    self.first = first
    @browser.button(type:"submit").click
    @browser.elements(class: 'rst__rowWrapper').size 
    sleep 2 
    self.second = second 
    @browser.button(type:"submit").click
    self.third = third 
    @browser.button(type:"submit").click
    self.fourth = fourth
    @browser.button(type:"submit").click
    self.fifth = fifth
    @browser.button(type:"submit").click
    sleep 3
    @browser.text.include?("Sprint 0 A").should_not == true
    sleep 3
	end
end
