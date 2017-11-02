class SearchCategoryPage
	include PageObject
	page_url 'https://playground.riskmethods.net/material_groups' 

	text_field(:first, class: "search-field")
	text_field(:second, class: "search-field")
	text_field(:third, class: "search-field")
	text_field(:fourth, class: "search-field")
	
	
	def search_category (first, second, third, fourth)
	@browser.element(class: "search-field").click 
    self.first = first
    @browser.button(type:"submit").click
    sleep 2 
    self.second = second 
    @browser.button(type:"submit").click
    self.third = third 
    @browser.button(type:"submit").click
    self.fourth = fourth
    @browser.button(type:"submit").click
    sleep 3
	end
end