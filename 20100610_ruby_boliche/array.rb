class Array
  def sum
    result = 0
    self.each do |item|
      result += item
    end
    result
  end
  
  def in_range(i)
    return i < self.length
  end
end
