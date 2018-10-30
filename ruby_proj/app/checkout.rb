class Checkout
  attr_reader :books, :cart

  def initialize(bookstore)
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

  def level2
    {
      'books' => books.map(&:to_hash),
      'cart' => {
        'total' => cart.total,
        'item_count' => cart.item_count,
        'cart_items' => cart.cart_items
      }
    }
  end

end
