require_relative 'bookstore'

class Checkout
  attr_reader :bookstore, :books, :cart

  def initialize(bookstore)
    @bookstore = bookstore
    @books = bookstore.books
    @cart = bookstore.cart
  end

  def level1
    {
      'books' => books.map(&:to_hash),
      'cart' => {
        'total' => cart.total,
        'item_count' => cart.item_count
      }
    }
  end

end
