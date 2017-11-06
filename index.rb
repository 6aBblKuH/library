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

data = [authors, books, readers, orders]
library = Library.new(books, orders, readers, authors)
library.save('data.yml', data)
library.statistics_output
