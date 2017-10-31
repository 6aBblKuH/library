class Reader
  attr_reader :name, :email, :city, :street, :house
  attr_accessor :activity

  def initialize(name, email, address)
    @name = name
    @email = email
    @city = address[:city]
    @street = address[:street]
    @house = address[:house]
    @activity = 0
  end

  def to_s
    @name
  end
end
