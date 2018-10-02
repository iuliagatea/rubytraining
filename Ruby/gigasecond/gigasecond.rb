class Gigasecond
	def self.from(datetime)
    raise ArgumentError.new("Please insert valid datetime") unless datetime.is_a?(Time)
		datetime + 1000000000
	end
end
