class CreateBUPage
	include PageObject

 text_field(:name, type:"text")
 text_field(:code, type:"text", :index => 1)
 link(:save, class: "btn-primary")

	def business_unit(name, code)
  	self.name = name
  	self.code = code
  	save.click
  	end
end