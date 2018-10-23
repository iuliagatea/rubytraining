require_relative 'book'

class Bookstore
  attr_accessor :books
  attr_reader :input

  def initialize(input)
    @input = JSON.parse(File.read(input))
    @books = @input['books'].map { |book| Book.new(book) }
    @books.sort_by!(&:title)
  end

end

