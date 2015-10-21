require_relative "Library"

describe Library do

  context '#classes_test' do

    author = Author.new('Author', 'Bibl')
    book = Book.new('Title', 'Author')
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

  context '#save_load' do

  end
  
end