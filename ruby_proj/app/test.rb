require 'minitest/autorun'
require 'json'
require_relative 'bookstore'

class CartTest < Minitest::Test
  def test_output_level1
    output = JSON.parse(File.read('../level1/output.json'))
    book_store = Bookstore.new('../level1/data.json')
    book_store.sort!
    book_store.add_to_cart(title: 'War and Peace')
    book_store.add_to_cart(title: 'Don Quixote')
    assert_equal output, book_store.output
  end
end


