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
    book = find_by(title)
    # I don't know with method is better.
    item = Item.new({ 'id' => cart.next_id, 'title' => book.title, 'price' => book.price} )
    # item = Item.new
    # item.id = cart.next_id
    # item.title = book.title
    # item.price = book.price
    cart.items << item
  end

  private

  def find_by(args = {})
    books.find { |book| book.send(args.keys.first) == args.values.first }
  end

end
