require_relative 'book'
require_relative 'cart'
require_relative 'item'

class Bookstore
  attr_accessor :books, :cart

  def initialize(file_path)
    file_contents = JSON.parse(File.read(file_path))
    @books = file_contents['books'].map { |book| Book.new(book) }
    @cart = Cart.new
  end

  def sort!
    books.sort_by!(&:title)
  end

  def add_to_cart(title)
    cart_item = cart.find_item(title)
    book = find_by(title)
    if book.in_stock?
      add_item_to_cart(cart_item, book)
    end
  end

  private

  def find_by(args = {})
    books.find { |book| book.send(args.keys.first) == args.values.first }
  end

  def add_item_to_cart(cart_item, book)
    if cart_item.nil?
      item = Item.new(cart.item_count, book)
      cart.items << item
    else
      cart_item.qty += 1
    end
    book.stock -= 1 if book.stock
  end

end
