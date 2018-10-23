require 'json'
require_relative 'bookstore'

class Cart
  attr_accessor :contents

  def initialize
    @contents = []
  end

  def output
    { 'total'  => total, 'item_count' => item_count }
  end

  private

  def item_count
    contents.count
  end

  def total
    contents.flatten.map(&:price).inject(0, :+)
  end

end
