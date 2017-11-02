class LoginPage
  include PageObject
  page_url 'https://playground.riskmethods.net/admins/login'

  text_field(:email, name:"admin[email]")
  text_field(:password, name:"admin[password]")
  button(:login, name:"commit")

  def login_with(email, password)
    self.email = email
    self.password = password
    login
  end

end