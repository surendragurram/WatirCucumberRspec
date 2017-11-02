class CreateSupplierPage
  include PageObject
  page_url 'https://playground.riskmethods.net/risk_object/suppliers/new'

  text_field(:supplier_name, name:"wrapper_supplier_form_object[name]")
  text_field(:address, name:"wrapper_supplier_form_object[address1]")
  text_field(:zipcode, name:"wrapper_supplier_form_object[zipcode]")
  text_field(:city, name:"wrapper_supplier_form_object[city]")
  text_field(:state, name:"wrapper_supplier_form_object[state]")
  element(:on, class:"switch")
  button(:save_supplier, name: 'commit')

  def populate_data(name, country)
    self.supplier_name = name
    self.address = 'Estrada da Pocarica'
    self.zipcode = '6300'
    self.city = 'Guarda'
    self.state = ''
    parent_class = "wrapper_supplier_form_object_country_id"
    drop_down_button = @browser.element(class: parent_class).divs(class: 'controls').first.spans.first
    drop_down_button.click
    xpath_element(parent_class: 'select2-container--open', child_class: 'select2-search__field').to_subtype.set(country)
    @browser.element(class: 'select2-results__option--highlighted').click
  end

  def geo_coder()
    sleep 2
    @browser.element(class: 'switch').click
    sleep 2
    @browser.element(class: 'switch').click
    sleep 5
    @browser.element(class: 'leaflet-tile leaflet-tile-loaded',:index => 1).click
  end

  def attributes()
    @browser.driver.execute_script("window.scrollBy(0,400)")
    @browser.element(class:"wrapper_supplier_form_object_material_group_ids").click 
    @browser.element(id:"2807_anchor").click 
    @browser.element(class:"wrapper_supplier_form_object_product_group_ids").click 
    @browser.element(id:"13890_anchor").click 
    @browser.element(class:"wrapper_supplier_form_object_business_unit_ids").click  
    @browser.element(id:"4804_anchor").click   
    sleep 5  
    @browser.driver.execute_script( "window.scrollBy(0,400)" )  
    save_supplier
  end

  def xpath_element(parent_class:, child_class:)
   @browser.element(xpath: "//span[contains(concat(' ', normalize-space(@class), ' '), concat(' ', '#{parent_class}', ' '))]//input[@class='#{child_class}']")
  end
  
end