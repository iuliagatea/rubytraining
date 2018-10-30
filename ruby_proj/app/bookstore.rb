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
    check_item = cart.check_item(title)
    if check_item.nil?
      book = find_by(title)
      item = Item.new(cart.item_count, book)
      cart.items << item
    else
      item = check_item
      item.qty += 1
    end
  end

  private

  def find_by(args = {})
    books.find { |book| book.send(args.keys.first) == args.values.first }
  end

end
