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

end
