require 'minitest/autorun'
require 'json'
require_relative 'cart'

class CartTest < Minitest::Test
  def test_output
    output = JSON.parse(File.read('output.json'))
    book_store = Bookstore.new('data.json')
    book_store.sort!
    book_store.add_to_cart('War and Peace')
    book_store.add_to_cart('Don Quixote')
    assert_equal output, book_store.cart_output
  end
end


