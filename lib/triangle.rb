class Triangle
  def initialize(len1, len2, len3)
    @len1 = len1
    @len2 = len2 
    @len3 = len3 
  end
  attr_reader :len1, :len2, :len3

  def kind
    len_arr = [len1, len2, len3]
    if len_arr.find {|i| i <= 0} || len_arr.sort[0] + len_arr.sort[1] <= len_arr.sort[2]
      begin
        raise TriangleError
      end
    else
      case len_arr.uniq.length
      when 1 then :equilateral
      when 2 then :isosceles
      when 3 then :scalene
      end
    end
  end

  class TriangleError < StandardError
    def message
      "Invalid triangle"
    end
  end
end
