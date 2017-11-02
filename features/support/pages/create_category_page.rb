class CreateCategoryPage

	include PageObject

	text_field(:first_field, type:"text")
    text_field(:second_field, type:"text",:index => 1)
    text_field(:edit_first_field, type:"text")
    text_field(:edit_second_field, type:"text",:index => 1)

    def populate_data(first_field, second_field, edit_first_field, edit_second_field)
    	self.first_field = first_field
    	self.second_field = second_field
    	@browser.element(class: "btn-primary").click
    	sleep 2
        @browser.element(class: "rst__rowWrapper",:index => 8).hover 
        @browser.element(class: "tree__editIcon___3xKWK",:index => 8).click
        self.edit_first_field = edit_first_field
    	self.edit_second_field = edit_second_field
    	@browser.element(class: "btn-primary").click
    end
end