# frozen_string_literal: true

class Library
  attr_accessor :books, :orders, :readers, :authors

  def initialize(books = [], orders = [], readers = [], authors = [])
    @books = books
    @orders = orders
    @readers = readers
    @authors = authors
    load
  end

  def <<(item)
    needed_array = case item
    when Book then @books
    when Order then @orders
    when Reader then @readers
    when Author then @authors
    else "Unnormed argument #{item}"
    end
    needed_array << item
  end

  def rated_books_output
    count_book_orders.map do |book, quantity_orders|
      puts "#{book} - #{quantity_orders}"
    end
  end

  def most_popular_book
    @books.max_by(&:rate)
  end

  def most_active_reader
    @readers.max_by(&:activity)
  end

  def uniq_orders_by_book_rating(quantity = 1)
    @orders.uniq(&:book).sort_by(&:book).first(quantity)
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
    File.new("data/#{filename}", 'w+') unless File.exist?("data/#{filename}")
    File.write("data/#{filename}", data.to_yaml)
  end

  def storaged_data(filename)
    YAML.load_file("data/#{filename}")
  end

  def load
    data = storaged_data('data.yml')
    if data
      @authors.concat(data[:authors])
      @books.concat(data[:books])
      @readers.concat(data[:readers])
      @orders.concat(data[:orders])
    end
  end
end
