class Item
  attr_accessor :id, :title, :price, :qty

  def initialize(items_in_cart, book)
    @id = items_in_cart + 1
    @title = book.title
    @price = book.price
    @qty = 1
  end

  def to_hash
    {
      'id' => id,
      'title' => title,
      'price' => price
    }
  end

  def to_hash_with_qty
    to_hash.merge({ 'qty' => qty })
  end

end
