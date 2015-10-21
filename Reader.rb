class Reader

  def initialize name, email, street, house
    @name, @email, @street, @house = name, email, street, house
  end

  def to_s
    "#{@name}"
  end

end