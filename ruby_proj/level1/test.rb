require 'minitest/autorun'
require 'json'
require_relative 'cart'

class CartTest < Minitest::Test
  def test_output
    output = JSON.parse(File.read('output.json'))
    assert_equal output, Cart.new('data.json').output
  end
end


