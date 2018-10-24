class Book
  attr_accessor :id, :title, :price

  def initialize(book_details = {})
    @id = book_details['id']
    @title = book_details['title']
    @price = book_details['price']
  end

  def to_hash
    { 'id' => id, 'title' => title, 'price' => price }
  end

end
