require 'pry'
require "yaml"
Dir['./models/*.rb'].each { |file| require file }

authors = [
  Author.new('Lion Fat'),
  Author.new('Grisha Kuciy'),
  Author.new('Vasyl Chornenko')
]
books = [
  Book.new('Lord of the Rings', authors[0]),
  Book.new('Harry Potter', authors[1]),
  Book.new('How To Meet Ladies', authors[2])
]
readers = [
  Reader.new('Dimasta', 'd@i.us', { city: 'DP', street: 'Test st.', house: '1' }),
  Reader.new('Tets', 't@i.ua', { city: 'DP', street: '1 st.', house: '0'})
]
orders = [
  Order.new(books[0], readers[0], Time.now),
  Order.new(books[0], readers[1], Time.now),
  Order.new(books[1], readers[0], Time.now),
  Order.new(books[0], readers[0], Time.now),
  Order.new(books[2], readers[1], Time.now)
]
File.new("data/data.yml","w+") unless File.exist?('data/data.yml')
data = [authors, books, readers, orders]
File.write('data/data.yml', data.to_yaml) #Store
library = Library.new(books, orders, readers, authors)
library_data = YAML::load_file('./data/data.yml')
library.info
