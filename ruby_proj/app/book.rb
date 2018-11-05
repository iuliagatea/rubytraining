class Book
  attr_accessor :id, :title, :price, :stock

  def initialize(book_details = {})
    @id = book_details['id']
    @title = book_details['title']
    @price = book_details['price']
    @stock = book_details['stock']
  end

  def to_hash
    {
      'id' => id,
      'title' => title,
      'price' => price
    }
  end

  def to_hash_with_stock
    to_hash.merge({ 'stock' => stock })
  end

  def in_stock?
    stock.nil? || stock > 0
  end

  def increment_stock(qty = 1)
    self.stock += qty
  end

  def decrement_stock(qty = 1)
    self.stock -= qty
  end

end
