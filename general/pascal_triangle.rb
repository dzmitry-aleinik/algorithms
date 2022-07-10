
#   Input: numRows = 5
#   Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]

def generate_pascal(num_rows)
  triangle = []

  (0..num_rows - 1).each do |index|
    triangle << generate_line(triangle[index - 1] || [])
  end

  triangle
end

def generate_line(prev_line)
  return [1] if prev_line.empty?
  return [1, 1] if prev_line.size == 1

  triangle_line = [1]
  (0..prev_line.size - 2).each do |index|
    triangle_line << prev_line[index] + prev_line[index + 1]
  end
  triangle_line << 1
  triangle_line
end

def generate_pascal_v2(num_rows)
  triangle = []

  (0..num_rows - 1).each do |i|
    line = []
    (0..i).each do |j|
      new_number = if j == 0 || j == i
                     1
                   else
                     triangle[i - 1][j - 1] + triangle[i - 1][j]
                   end

      line << new_number
    end
    triangle << line
  end

  triangle
end

p generate_pascal_v2(3)
