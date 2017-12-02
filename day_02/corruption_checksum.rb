input_string = <<-matrix
1 4 5 6
8 2 6 7
2 5 9
7 5 6 1
matrix

def build_matrix(input_string)
  rows = input_string.split("\n")
  rows.map { |row| row.split(/\W+/).map(&:to_i) }
end

matrix = build_matrix(input_string)

def find_checksum(matrix)
  matrix.reduce(0) { |sum, row| sum + row_value(row) }
end

def row_value(row)
  # for part 1 of the solution
  # row.max - row.min

  high_to_low = row.sort { |a, b| b <=> a }

  # I can't lazy.map.with_index :(
  high_to_low.map.with_index do |numerator, index|
    denominators = high_to_low[(index+1)..-1]

    denominators.lazy.map do |denominator|
      evenly_divisible = numerator % denominator == 0
      
      evenly_divisible && numerator / denominator
    end.find { |i| i }
  end.find { |i| i }
end

# What I was using for testing (should equal 7)
# puts row_value([63, 9, 23, 24].shuffle)
puts find_checksum(matrix)