class Point
  attr_accessor :row, :col, :value

  def initialize(row, col, value)
    @row = row
    @col = col
    @value = value
  end
end

class Vector
  attr_accessor :rows
  def initialize(size)
    @rows = create_vector(size)
  end

  def midpoint
    rows[rows.count/2][rows.count/2]
  end

  def set_point(x, y, value)
    rows[x][y].value = value
  end

  def get_point(x, y)
    rows[x][y].value
  end

  def top_left(x, y)
    rows[x-1][y-1].value
  end

  def top_mid(x, y)
    rows[x-1][y].value
  end

  def top_right(x, y)
    rows[x-1][y+1].value
  end

  def left(x, y)
    rows[x][y-1].value
  end

  def right(x, y)
    rows[x][y+1].value
  end

  def bot_left(x, y)
    rows[x+1][y-1].value
  end

  def bot_mid(x, y)
    rows[x+1][y].value
  end

  def bot_right(x, y)
      rows[x+1][y+1].value
  end

  def sum_of_neighbor_pts(x, y)
    sum = top_left(x,y) + top_mid(x,y) + top_right(x,y) + left(x,y) + right(x,y) + bot_left(x,y) + bot_mid(x,y) + bot_right(x,y)
    sum == 0 ? 1 : sum
  end

  def create_vector(size)
    rows = []
    size.times do |i|
      points = []
      size.times do |j|
        points << Point.new(i, j, 0)
      end
      rows << points
    end
    rows
  end
end

class Spiralizer
  attr_accessor :vector, :current_point

  def initialize(vector)
    @vector = vector
    @current_point = vector.midpoint
  end

  def move_right
    curr = current_point
    @current_point = vector.rows[curr.row][curr.col + 1]
  end

  def move_up
    curr = current_point
    @current_point = vector.rows[curr.row - 1][curr.col]
  end

  def move_left
    curr = current_point
    @current_point = vector.rows[curr.row][curr.col - 1]
  end

  def move_down
    curr = current_point
    @current_point = vector.rows[curr.row + 1][curr.col]
  end

  def write_value

    curr = current_point
    x = curr.row
    y = curr.col

    current_point.value = vector.sum_of_neighbor_pts(x, y)

    if current_point.value > 361527
      puts "#{current_point.value}"
      exit 0
    end
  end

  def draw_spiral(max_val)
    write_value
    i = 0
    while current_point.value < max_val do

      if current_point.value == 1
        move_right
        write_value
      else
        until vector.left(current_point.row, current_point.col) == 0
          move_up
          write_value
        end
      end

      if i == 0
        move_up
        write_value
      end

      until vector.bot_mid(current_point.row, current_point.col) == 0
        move_left
        write_value
      end

      until vector.right(current_point.row, current_point.col) == 0
        move_down
        write_value
      end

      until vector.top_mid(current_point.row, current_point.col) == 0
        move_right
        write_value
      end
      i += 1
    end
  end
end

input = 1000
v = Vector.new(input)

s = Spiralizer.new(v)
s.draw_spiral 100_000_000

s.vector.rows.each do |row|
  puts row.to_s
end
