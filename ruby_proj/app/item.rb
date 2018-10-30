class Item
  attr_accessor :id, :title, :price

  def initialize(items_in_cart, book)
    @id = items_in_cart + 1
    @title = book.title
    @price = book.price
  end

  def to_hash
    {
      'id' => id,
      'title' => title,
      'price' => price
    }
  end

end
