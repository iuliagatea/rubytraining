require_relative 'book'

class Bookstore
  attr_accessor :books, :cart
  attr_reader :input

  def initialize(input)
    @input = JSON.parse(File.read(input))
    @books = @input['books'].map { |book| Book.new(book) }
    @cart = Cart.new
  end

  def sort!
    books.sort_by!(&:title)
  end

  def add_to_cart(title)
    cart.contents << find_by(title)
  end

  def cart_output
    {
      'books' => books.map(&:to_hash),
      'cart' => cart.output
    }
  end

  private

  def find_by(title)
    books.select { |book| book.title == title }
  end

end

