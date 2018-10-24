require_relative 'book'
require_relative 'cart'
require 'byebug'

class Bookstore
  attr_accessor :books, :cart

  def initialize(file_path)
    @file_path = JSON.parse(File.read(file_path))
    @books = @file_path['books'].map { |book| Book.new(book) }
    @cart = Cart.new
  end

  def sort!
    books.sort_by!(&:title)
  end

  def add_to_cart(title)
    cart.items << find_by(title)
  end

  def output
    {
      'books' => books.map(&:to_hash),
      'cart' => cart.output
    }
  end

  private

  def find_by(args = {})
    # byebug
    books.select { |book| book.send(args.keys.first) == args.values.first }
  end

end
