require 'json'
require_relative 'bookstore'

class Cart

  def initialize(input_file)
    @book_store = Bookstore.new(input_file).books
  end

  def contents
    contents = []
    contents << find_book_after('War and Peace')
    contents << find_book_after('Don Quixote')
  end

  def output
    output = {}
    output['books'] = book_store.map(&:to_hash)
    output['cart'] = cart
    output
  end

  private

  attr_reader :book_store

  def find_book_after(book_title)
    book_store.select { |book| book.title == book_title }
  end

  def item_count
    contents.count
  end

  def total
    contents.flatten.map(&:price).inject(0, :+)
  end

  def cart
    cart = {}
    cart['total'] = total
    cart['item_count'] = item_count
    cart
  end

end
