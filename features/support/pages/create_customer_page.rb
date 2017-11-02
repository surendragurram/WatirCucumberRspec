class CreateCustomerPage
     include PageObject

   text_field(:name, name:"wrapper_debitor_form_object[name]")
   text_field(:address, name:"wrapper_debitor_form_object[address1]")
   text_field(:city, name:"wrapper_debitor_form_object[city]")
   text_field(:zipcode, name:"wrapper_debitor_form_object[zipcode]")
   button(:save_supplier, name: 'commit')

   def populate_data(name, address, city, zipcode)
   	self.name = name
   	self.address = address
   	self.city = city
   	self.zipcode = zipcode 
   	parent_class = "wrapper_debitor_form_object_country_id"
    drop_down_button = @browser.element(class: parent_class).divs(class: 'controls').first.spans.first
    drop_down_button.click
    xpath_element(parent_class: 'select2-container--open', child_class: 'select2-search__field').to_subtype.set('Italy')
    @browser.element(class: 'select2-results__option--highlighted').click
   end

   def catgories_pg_bu()
   	@browser.driver.execute_script("window.scrollBy(0,600)")
    @browser.element(class:"wrapper_debitor_form_object_material_group_ids").click 
    @browser.element(id:"2823_anchor").click 
    @browser.element(class:"wrapper_debitor_form_object_product_group_ids").click
    sleep 5 
    @browser.element(id:"14098_anchor").click 
    @browser.element(class:"wrapper_debitor_form_object_business_unit_ids").click  
    @browser.element(id:"4868_anchor").click   
    sleep 5  
    @browser.driver.execute_script( "window.scrollBy(0,400)" )
    save_supplier
   end

   def xpath_element(parent_class:, child_class:)
   @browser.element(xpath: "//span[contains(concat(' ', normalize-space(@class), ' '), concat(' ', '#{parent_class}', ' '))]//input[@class='#{child_class}']")
   end
end