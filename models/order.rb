class Order
  attr_reader :book, :reader, :date

  def initialize(book, reader, date)
    @book = book
    @reader = reader
    @date = date
    @book.rate += 1
    @reader.activity += 1
  end
end
