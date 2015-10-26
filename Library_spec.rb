require_relative "Library"

describe Library do

  context '#classes_test' do

    author = Author.new('Author', 'Bio')
    book = Book.new('Title', author)
    reader = Reader.new('Reader', 'email', 'street', 'house')
    it 'Author test' do
      expect(author.to_s).to eq 'Author'
    end
    it 'Book test' do
      expect(book.to_s).to eq 'Title, Author'
    end
    it 'Reader test' do
      expect(reader.to_s).to eq 'Reader'
    end
    it 'Order test' do
      ord_date = Time.now()
      order = Order.new(book, reader, ord_date)
      expect(order.to_s).to eq "Reader - Title, Author - #{ord_date}"
    end

  end

  context '#manage_librari' do

    library1 = Library.new()
    author = Author.new('Author', 'Bio')
    author1 = Author.new('Author1', 'Bio')
    book = Book.new('Title', author)
    book1 = Book.new('Title1', author1)
    it 'Add author' do
      
      author_lib = library1.add_author(name: 'Author', biography: 'Bio')

      expect(author_lib).to eq author

    end

    it 'Add book' do

      book_lib = library1.add_book(title: 'Title', author: author)

      expect(book_lib).to eq book

    end

    it 'Add book with author string exist' do

      book_lib = library1.add_book(title: 'Title', author: 'Author')

      expect(book_lib).to eq book

    end

    it 'Add book with author string not exist exept' do

      expect {
        library1.add_book(title: 'Title1', author: 'Author1')

      }.to raise_error(ArgumentError, "Unknown author!")

    end

    it 'Add book with author string not exist addauthor' do

      book_lib = library1.add_book(title: 'Title1', author: 'Author1', addauthor: true)

      expect(book_lib).to eq book1

    end

    it 'save_load' do
      tmp_file = 'temp'
      author = Author.new('Author', 'Bio')
      library1.save_to_file(tmp_file)
      library2 = Library.new()
      library2.load_from_file(tmp_file)


      expect(library2).to eq library1

    end
  end
end