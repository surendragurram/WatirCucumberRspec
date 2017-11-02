class CreateLocationPage
   include PageObject
   page_url 'https://playground.riskmethods.net/risk_object/locations/new'
   text_field(:address, name:"risk_object_location_form_object[address1]")
   text_field(:zipcode, name:"risk_object_location_form_object[zipcode]")
   text_field(:city, name:"risk_object_location_form_object[city]")
   button(:save_supplier, name: 'commit')

def hot_spot()
  parent_class = "risk_object_location_form_object_hot_spot_id_for_selects"
  drop_down_button = @browser.element(class: parent_class).divs(class: 'controls').first.spans.first
  drop_down_button.click
  xpath_element(parent_class: 'select2-container--open', child_class: 'select2-search__field').to_subtype.set('Munich (Franz Josef Strauß Airport, MUC)')
  @browser.element(class: 'select2-results__option--highlighted').click
  sleep 5
  @browser.driver.execute_script( "window.scrollBy(0,document.body.scrollHeight)" )
  save_supplier
  end

  def new_location(address, zipcode, city)
   @browser.checkbox(name:"risk_object_location_form_object[custom_location]").set
    self.address = address
    self.city = zipcode
    self.zipcode = city
   parent_class = "risk_object_location_form_object_country_id"
   drop_down_button = @browser.element(class: parent_class).divs(class: 'controls').first.spans.first
   drop_down_button.click
   xpath_element(parent_class: 'select2-container--open', child_class: 'select2-search__field').to_subtype.set('Australia')
   @browser.element(class: 'select2-results__option--highlighted').click
   @browser.text_field(name:"risk_object_location_form_object[name]").set('Lokation qm41 manuell')
   save_supplier
   sleep 2
  end

  def xpath_element(parent_class:, child_class:)  
   @browser.element(xpath: "//span[contains(concat(' ', normalize-space(@class), ' '), concat(' ', '#{parent_class}', ' '))]//input[@class='#{child_class}']")
  end
end 

