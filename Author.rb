class Author

  attr_reader :name, :biography

  def initialize name, biography
    @name, @biography = name, biography
  end

  def to_s
    "#{@name}"
  end

  def == other
    @name == other.name #and @biography == other.biography 
  end

end