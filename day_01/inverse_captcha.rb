# To get the input, I copied the string of characters into a string, split it, and then mapped
# them to integers.

def collect_sum(input)
  input = CircularArray.new(input)
  # This was for part 1 of the puzzle
  # distance = 1
  distance = input.length / 2

  matches = []
  
  (0...input.length).each do |index|
    matches << input[index] if input[index] == input[index + distance]
  end

  matches.inject(:+)
end

class CircularArray < Array
  def [](index)
    at(index % length)
  end
end