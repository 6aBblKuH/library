class Reader
  attr_reader :name, :email, :city, :street, :house

  def initialize(name, email, adress)
    @name = name
    @email = email
    @city = adress[:city]
    @street = adress[:street]
    @house = adress[:house]
  end
end
