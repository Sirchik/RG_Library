class Order

  attr_reader :book, :reader, :date

  def initialize book, reader, date = Time.now()
    @book, @reader, @date = book, reader, date
  end

  def to_s
    "#{@reader} - #{@book} - #{@date}"
  end

  def == other
    @reader == other.reader and @book == other.book and @date == other.date
  end

end