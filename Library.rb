require_relative "Author"
require_relative "Book"
require_relative "Order"
require_relative "Reader"

# require 'pry'
require 'pry-byebug'
# require 'pry'

class Library

  attr_reader :books, :orders, :readers, :authors

  def initialize books: [], orders: [], readers: [], authors: []
    @books, @orders, @readers, @authors = books, orders, readers, authors
  end

  def add_book title:, author:, addauthor: false
    if title.is_a?(String)
      if title.empty?
        fail ArgumentError, "Title is empty!"
      end
      if author.is_a?(String)
        if author.empty?
          fail ArgumentError, "Author is empty!"
        else
          author_name = author
          author = find_author(author_name) #exception
          # binding.pry
          if author.nil?
            if addauthor
              author = add_author(name: author_name)
            else
              fail ArgumentError, "Unknown author!"    
            end
          end
        end
      elsif !author.is_a?(Author)
        fail ArgumentError, "Unknown author!"
      end
      book = Book.new(title, author)
      @books << book
      book
    else
      fail ArgumentError, "Title is wrong!"
    end
  end

  def add_author name:, biography: ''
    if name.is_a?(String)
      if name.empty?
        fail ArgumentError, "Name is empty!"
      end
      author = Author.new(name, biography)
      @authors << author
      author
    else
      fail ArgumentError, "Name is wrong!"
    end
  end

  def add_reader name:, email: '', street: '', house: ''
    if name.is_a?(String)
      if name.empty?
        fail ArgumentError, "Name is empty!"
      end
      reader = Reader.new(name, email, street, house)
      @readers << reader
      reader
    else
      fail ArgumentError, "Name is wrong!"
    end
  end

  def add_order book:, reader:, date: Time.now()
    if book.is_a?(String)
      book = find_book(book) #exception
    elsif !book.is_a?(Book)
      fail ArgumentError, "Unknown book!"
    end
    if reader.is_a?(String)
      reader = find_reader(reader) #exception
    elsif !reader.is_a?(Reader)
      fail ArgumentError, "Unknown reader!"
    end
    order = Order.new(book, reader, date)
    @orders << order
    order
  end

  def most_reading_reader

  end

  def most_popular_book

  end

  def count_reader_for_top_three_books

  end

  def save_to_file file
    File.open(file, "wb") { |file| file.write(Marshal.dump(self)) }
  end

  def load_from_file file
    lib = Marshal.load(File.open(file, "rb").read)
    if lib.is_a?(Library)
      @books, @orders, @readers, @authors = lib.books, lib.orders, lib.readers, lib.authors
    else
      fail LoadError, "Unknown format!"
    end
  end

  def find_author name
    authors.find {|auth| auth.name == name}
  end

  def == other
    @books == other.books and @orders == other.orders and @readers == other.readers and @authors == other.authors
  end

end