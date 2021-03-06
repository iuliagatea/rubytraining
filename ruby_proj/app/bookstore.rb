require_relative 'book'
require_relative 'cart'
require_relative 'item'
require 'byebug'

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
    add_item_to_cart(cart_item, book) if book.in_stock?
  end

  def remove_from_cart(title)
    restore_qty = cart.remove_item(title)
    book = find_by(title)
    book.increment_stock(restore_qty) if restore_qty
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
    book.decrement_stock if book.stock
  end

end
