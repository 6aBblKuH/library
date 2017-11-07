# frozen_string_literal: true

require 'pry'
require 'yaml'
Dir['./models/*.rb'].each { |file| require file }

authors = [
  Author.new('Lion Fat'),
  Author.new('Grisha Kuciy'),
  Author.new('Vasyl Chornenko')
]
books = [
  Book.new('Lord of the things', authors.sample),
  Book.new('Harry Propper', authors.sample),
  Book.new('How To Meet Ladies', authors.sample)
]
readers = [
  Reader.new('Dima', 'd@i.us', { city: 'DP', street: 'Test st.', house: '1' }),
  Reader.new('Ted', 't@i.ua', { city: 'DP', street: '1 st.', house: '0' })
]
orders = []
100.times { orders << Order.new(books.sample, readers.sample, Time.now) }

data = { books: books, orders: orders, readers: readers, authors: authors }
library = Library.new()
library.save('data.yml', data)

puts 'Most active reader is:'
puts library.most_active_reader.to_s
puts 'Most popular book is:'
puts library.most_popular_book.to_s
puts 'Quantity of orders most popular books:'
library.rated_books_output
