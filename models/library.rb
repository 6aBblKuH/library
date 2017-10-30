class Library
  attr_accessor :books, :orders, :readers, :authors

  def initialize(books, orders, readers, authors)
    @books = books
    @orders = orders
    @readers = readers
    @authors = authors
  end

  def info
    reader = most_active_reader
    book = most_popular_book
    puts "Most active reader is " + reader.to_s
    puts "Most popular book is " + book.to_s
    puts "Quantity of orders most popular books:"
    count_book_orders.each { |k, v| puts "#{k} - #{v}" }
  end

  def most_popular_book
    @books.max_by(&:rate)
  end

  def most_active_reader
    @readers.max_by(&:activity)
  end

  def uniq_orders_by_book_rating(quantity = 1)
    orders = @orders.uniq(&:book).sort { |x, y| y.book.rate <=> x.book.rate }
    orders[0..quantity - 1]
  end

  def count_book_orders
    orders = uniq_orders_by_book_rating(3)
    raise "Orders not found" if orders.empty?
    counts = {}
    orders.each do |item|
      counts[item.book.to_s] = @orders.count { |e| e.book == item.book }
    end
    counts
  end
end
