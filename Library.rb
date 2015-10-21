require_relative "Author"
require_relative "Book"
require_relative "Order"
require_relative "Reader"

class Library

  def initialize books: [], orders: [], readers: [], authors: []
    @books, @orders, @readers, @authors = :books, orders:, readers:, authors:
  end

  def add_book title:, author:
    if title:.is_a?(String)
      if title:.empty?
        fail ArgumentError, "Title is empty!"
      end
      if author:.is_a?(String)
        author = find_author(author:) #exception
      elsif author:.is_a?(Author)
        author = author:
      else
        fail ArgumentError, "Unknown author!"
      end
      book = Book.new(title:, author)
      @books << book
    else
      fail ArgumentError, "Title is wrong!"
    end
  end

  def add_author name:, biography: ''
    if name:.is_a?(String)
      if name:.empty?
        fail ArgumentError, "Name is empty!"
      end
      author = Author.new(name:, biography:)
      @authors << author
    else
      fail ArgumentError, "Name is wrong!"
    end
  end

  def add_reader name:, email: '', street: '', house: ''
    if name:.is_a?(String)
      if name:.empty?
        fail ArgumentError, "Name is empty!"
      end
      reader = Reader.new(name:, email:, street:, house:)
      @readers << reader
    else
      fail ArgumentError, "Name is wrong!"
    end
  end

  def add_order book:, reader:, date: = Time.now()
    if book:.is_a?(String)
      book = find_book(book:) #exception
    elsif book:.is_a?(Book)
      book = book:
    else
      fail ArgumentError, "Unknown book!"
    end
    if reader:.is_a?(String)
      reader = find_reader(reader:) #exception
    elsif reader:.is_a?(Reader)
      reader = reader:
    else
      fail ArgumentError, "Unknown reader!"
    end
    order = Order.new(book, reader, date:)
    @orders << order
  end



  def most_reading_reader

  end

  def most_popular_book

  end

  def count_reader_for_top_three_books

  end

  def save_to_file file

  end

  def load_from_file file

  end


  def find_author name

  end

end