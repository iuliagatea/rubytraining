class Item
  attr_accessor :id, :title, :price

  def initialize(cart, item_details = {})
    @id = next_id(cart)
    @title = item_details['title']
    @price = item_details['price']
  end

  def next_id(cart)
    cart.item_count + 1
  end

  def to_hash
    {
      'id' => id,
      'title' => title,
      'price' => price
    }
  end

end
