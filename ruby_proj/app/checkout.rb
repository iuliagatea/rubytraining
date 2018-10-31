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

  def level3
    {
      'books' => books.map(&:to_hash),
      'cart' => {
        'total' => cart.sub_total,
        'item_count' => cart.qty_count,
        'cart_items' => cart.cart_items_with_qty
      }
    }
  end

  def level4
    {
      'books' => books.map(&:to_hash_with_stock),
      'cart' => {
        'total' => cart.sub_total,
        'item_count' => cart.qty_count,
        'cart_items' => cart.cart_items_with_qty
      }
    }
  end

  def level5
    {
      'books' => books.map(&:to_hash_with_stock),
      'cart' => {
        'total' => cart.sub_total - cart.discount,
        'sub_total' => cart.sub_total,
        'promotion' => cart.discount,
        'item_count' => cart.qty_count,
        'cart_items' => cart.cart_items_with_qty
      }
    }
  end
end
