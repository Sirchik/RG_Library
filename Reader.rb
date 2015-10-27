class Reader

  attr_reader :name, :email, :street, :house

  def initialize name, email = '', street = '', house = ''
    @name, @email, @street, @house = name, email, street, house
  end

  def to_s
    "#{@name}"
  end

  def == other
    @name == other.name and @email == other.email and @street == other.street and @house == other.house
  end

end