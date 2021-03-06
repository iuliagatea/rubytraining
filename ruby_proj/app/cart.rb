class Cart
  attr_accessor :items

  def initialize
    @items = []
  end

  def item_count
    items.count
  end

  def total_with_discount
    sub_total - discount
  end

  def total
    items.map(&:price).inject(0, :+)
  end

  def sub_total
    items.map { |item| item.price * item.qty }.inject(0, :+)
  end

  def discount
    if sub_total > 100
      promotion = 0.1 * sub_total
      promotion = promotion.to_i if promotion == promotion.to_i
      promotion
    else
      0
    end
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

  def find_item(args = {})
    items.find { |item| item.send(args.keys.first) == args.values.first }
  end

  def remove_item(args = {})
    cart_item = find_item(args)
    cart_item.qty if items.delete_if { |item| item == cart_item }
  end

end
