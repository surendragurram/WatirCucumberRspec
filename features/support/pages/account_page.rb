class AccountPage
  include PageObject
  page_url 'https://playground.riskmethods.net/admins/users'

  text_field(:name, name:"query")
  button(:search, name:"commit")

  def search_for_customer(name)
    self.name = name
    search
    customer_id = @browser.table[5][0].text
    @browser.link(href: "/admins/users/#{customer_id}/login_as").click
  end
end