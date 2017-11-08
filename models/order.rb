# frozen_string_literal: true

class Order
  attr_reader :book, :reader, :date

  def initialize(book, reader)
    @book = book
    @reader = reader
    @date = Time.now
    @book.rate += 1
    @reader.activity += 1
  end
end
