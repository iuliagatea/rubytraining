require 'minitest/autorun'
require 'json'
require_relative 'bookstore'
require_relative 'checkout'

class BookstoreTest < Minitest::Test

  def test_output_level1
    output = JSON.parse(File.read('../level1/output.json'))
    book_store = Bookstore.new('../level1/data.json')
    book_store.sort!
    book_store.add_to_cart(title: 'War and Peace')
    book_store.add_to_cart(title: 'Don Quixote')
    assert_equal output, Checkout.new(book_store).level1
  end

  def test_output_level2
    output = JSON.parse(File.read('../level2/output.json'))
    book_store = Bookstore.new('../level2/data.json')
    book_store.add_to_cart(title: 'War and Peace')
    book_store.add_to_cart(title: 'In Search of Lost Time')
    assert_equal output, Checkout.new(book_store).level2
  end

  def test_output_level3
    output = JSON.parse(File.read('../level3/output.json'))
    book_store = Bookstore.new('../level3/data.json')
    book_store.add_to_cart(title: 'Les Misérables ')
    3.times { book_store.add_to_cart(title: 'War and Peace') }
    assert_equal output, Checkout.new(book_store).level3
  end

  def test_output_level4
    output = JSON.parse(File.read('../level4/output.json'))
    book_store = Bookstore.new('../level4/data.json')
    book_store.add_to_cart(title: 'War and Peace')
    2.times { book_store.add_to_cart(title: 'Animal Farm') }
    assert_equal output, Checkout.new(book_store).level4
  end

  def test_output_level5
    output = JSON.parse(File.read('../level5/output.json'))
    book_store = Bookstore.new('../level5/data.json')
    book_store.add_to_cart(title: 'War and Peace')
    2.times { book_store.add_to_cart(title: 'Animal Farm') }
    assert_equal output, Checkout.new(book_store).level5
  end

end


