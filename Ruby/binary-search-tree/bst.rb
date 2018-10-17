class Bst

  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(element)
    if element <= data
      left ? left.insert(element) : self.left = Bst.new(element)
    else
      right ? right.insert(element) : self.right = Bst.new(element)
    end
  end

  def each(&block)
    return enum_for(:each) unless block_given?
    left.each(&block) if left
    yield(data)
    right.each(&block) if right
  end
end
