class Bst

  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
    @left
    @right
  end

  def insert(element)
    if element <= data
      insert_left(element)
    else
      insert_right(element)
    end
  end

  def each(&block)
    return enum_for(:each) unless block_given?
    left.each(&block) if left
    yield(data)
    right.each(&block) if right
  end

  private

  def insert_left(element)
    left ? left.insert(element) : @left = Bst.new(element)
  end

  def insert_right(element)
    right ? right.insert(element) : @right = Bst.new(element)
  end

end
