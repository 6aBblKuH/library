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
    count_book_orders.map do |book, quantity_orders|
      puts "#{book} - #{quantity_orders}"
    end
  end

  def most_popular_book
    raise "Books not found" if @books.empty?
    @books.max_by(&:rate)
  end

  def most_active_reader
    raise "Readers not found" if @readers.empty?
    @readers.max_by(&:activity)
  end

  def uniq_orders_by_book_rating(quantity = 1)
    raise "Orders not found" if @orders.empty?
    @orders.uniq(&:book).sort { |x, y| y.book.rate <=> x.book.rate }.first(quantity)
  end

  def count_book_orders
    orders = uniq_orders_by_book_rating(3)
    counts = {}
    orders.map do |item|
      counts[item.book.to_s] = @orders.count { |e| e.book == item.book }
    end
    counts
  end

  def save(filename, data)
    File.new("data/#{filename}","w+") unless File.exist?("data/#{filename}")
    File.write("data/#{filename}", data.to_yaml)
  end

  def storaged_data(filename)
    raise "File not found" unless File.file? "data/#{filename}"
    YAML::load_file("data/#{filename}")
  end
end
