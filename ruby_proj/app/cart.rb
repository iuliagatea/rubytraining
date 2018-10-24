class Cart
  attr_accessor :items

  def initialize
    @items = []
  end

  def output
    { 'total' => total, 'item_count' => item_count }
  end

  private

  def item_count
    items.count
  end

  def total
    items.flatten.map(&:price).inject(0, :+)
  end

end
