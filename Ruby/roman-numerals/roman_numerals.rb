class Roman
  ARABIC_TO_ROMAN = [[1, 'I'], [4, 'IV'], [5, 'V'], [9, 'IX'], [10, 'X'],
                     [40, 'XL'], [50, 'L'], [90, 'XC'], [100, 'C'], [400, 'CD'],
                     [500, 'D'], [900, 'CM'], [1000, 'M']].freeze

  def initialize(number)
    @number = number
  end

  def to_roman
    number_is_valid?
    roman_conversion = ''
    ARABIC_TO_ROMAN.reverse_each do |arabic, roman|
      num, @number = @number.divmod(arabic)
      roman_conversion << roman * num
    end
    roman_conversion
  end

  private

  attr_reader :number

  def number_is_valid?
    raise ArgumentError, 'Number must be between 1 and 3999' unless number.between?(1, 3999)
  end
end

class Fixnum
  def to_roman
    Roman.new(self).to_roman
  end
end
