class Gigasecond
  def self.from(datetime)
    raise ArgumentError.new("Please insert valid datetime") unless datetime.is_a?(Time)
    datetime + 10**9
  end
end
