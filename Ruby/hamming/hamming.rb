class Hamming
	def self.compute(s1, s2)
		raise ArgumentError.new("Sequencies with different length!") if s1.length != s2.length
		a1 = s1.split("")
		a2 = s2.split("")
		i = 0
		distance = 0
		while i< s1.length do
			distance += 1 if a1[i] != a2[i]
			i += 1
		end 		
		distance
	end
end

