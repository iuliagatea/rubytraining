class Cart
  attr_accessor :items

  def initialize
    @items = []
  end

  def item_count
    items.count
  end

  def total
    items.map(&:price).inject(0, :+)
  end

  def total_with_qty
    items.map { |item| item.price * item.qty }.inject(0, :+)
  end

  def cart_items
    items.map(&:to_hash)
  end

  def cart_items_with_qty
    items.map(&:to_hash_with_qty)
  end

  def qty_count
    items.map(&:qty).inject(0, :+)
  end

  def check_item(args = {})
    items.find { |item| item.send(args.keys.first) == args.values.first }
  end

end
