class Reader
  attr_reader :name, :email, :city, :street, :house
  attr_accessor :activity

  def initialize(name, email, adress)
    @name = name
    @email = email
    @city = adress[:city]
    @street = adress[:street]
    @house = adress[:house]
    @activity = 0
  end

  def to_s
    @name
  end
end
