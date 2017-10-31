require 'pry'
require "yaml"
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
  Reader.new('Ted', 't@i.ua', { city: 'DP', street: '1 st.', house: '0'})
]
orders = Array.new(10, Order.new(books.sample, readers.sample, Time.now))

data = [authors, books, readers, orders]
library = Library.new(books, orders, readers, authors)
library.save('data.yml', data)
library_data = library.storaged_data('data.yml')
library.info
