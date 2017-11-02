class CreateOwnsitePage

  include PageObject
  page_url 'https://playground.riskmethods.net/risk_object/manufactures/new'

    text_field(:name, name:"wrapper_manufacture_form_object[name]")
    text_field(:zipcode, name:"wrapper_manufacture_form_object[zipcode]")
    text_field(:address, name:"wrapper_manufacture_form_object[address1]")
    text_field(:city, name:"wrapper_manufacture_form_object[city]")
    button(:save_location, name:"commit")

    def own_site(name, zipcode, address, city)
      self.name = name
      self.zipcode = zipcode
      self.address = address 
      self.city = city
      parent_class = "wrapper_manufacture_form_object_country_id"
      drop_down_button = @browser.element(class: parent_class).divs(class: 'controls').first.spans.first
      drop_down_button.click
      xpath_element(parent_class: 'select2-container--open', child_class: 'select2-search__field').to_subtype.set('Australia')
      @browser.element(class: 'select2-results__option--highlighted').click
      sleep 3
      @browser.driver.execute_script( "window.scrollBy(0,document.body.scrollHeight)" )
      save_location
    end

def xpath_element(parent_class:, child_class:)  
   @browser.element(xpath: "//span[contains(concat(' ', normalize-space(@class), ' '), concat(' ', '#{parent_class}', ' '))]//input[@class='#{child_class}']")
end

end
