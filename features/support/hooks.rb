require 'watir'

Before do |scenario|
  DataMagic.load_for_scenario(scenario)
  @browser = Watir::Browser.new :chrome
  @browser.window.resize_to(1200, 1000)
end


After do
  @browser.close
end


