puzzle_input = 325489

DIRECTIONS = [:right, :up, :left, :down]

grid = Hash.new(0)

def turn!
  DIRECTIONS << DIRECTIONS.shift
end

def left(x, y)
  [x - 1, y]
end

def right(x, y)
  [x + 1, y]
end

def up(x, y)
  [x, y + 1]
end

def down(x, y)
  [x, y - 1]
end

def at_turning_section?(x, y)
  return false if x == 0 && y == 0       # at start
  return true if x == y                  # top right or bottom left
  return true if -(x) == y && x < 0      # top left
  return true if y <= 0 && -(y) + 1 == x # extending out 1 at bottom right
end

def traverse(x, y)
  turn! if at_turning_section?(x, y)
  send(DIRECTIONS.first, x, y)
end

def gather_neighbors(grid, x, y)
  neighbors = []
  neighbors << grid[[x-1, y-1]]
  neighbors << grid[[x-1, y]]
  neighbors << grid[[x-1, y+1]]
  neighbors << grid[[x, y-1]]
  neighbors << grid[[x, y+1]]
  neighbors << grid[[x+1, y-1]]
  neighbors << grid[[x+1, y]]
  neighbors << grid[[x+1, y+1]]
  neighbors
end

def calculate_value(grid, x, y)
  neighbors = gather_neighbors(grid, x, y)
  neighbors.inject(&:+)
end

square_number = 1

x = 0
y = 0

while square_number < puzzle_input
  grid[[x, y]] = square_number
  x, y = traverse(x, y)
  square_number = calculate_value(grid, x, y)
end

# Gathing values for first part 1
# (puzzle_input - 1).times do
#   square_number += 1
#   x, y = traverse(x, y)
# end

puts "#{square_number} (#{x}, #{y})"

# Outputting solution for part 1
# puts "Steps away: #{x.abs + y.abs}"
