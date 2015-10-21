class Order

  def initialize book, reader, date = Time.now()
    @book, @reader, @date = book, reader, date
  end

  def to_s
    "#{@reader} - #{@book} - #{@date}"
  end

end