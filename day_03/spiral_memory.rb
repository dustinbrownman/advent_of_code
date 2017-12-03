puzzle_input = 325489
DIRECTIONS = [:right, :up, :left, :down]

direction = :right

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

square_number = 1

x = 0
y = 0

(puzzle_input - 1).times do
  square_number += 1
  x, y = traverse(x, y)
end

puts "#{square_number} (#{x}, #{y})"
puts "Steps away: #{x.abs + y.abs}"
