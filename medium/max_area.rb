# frozen_string_literal: true

# https://leetcode.com/problems/container-with-most-water/
#Input: height = [1,8,6,2,5,4,8,3,7]
#Output: 49

# o(n^2)
# o(1)
def max_area_square(heights)
  max_square = 0

  (0..heights.size - 1).each do |i|
    ((i + 1)..(heights.size - 1)).each do |j|
      height = [heights[i], heights[j]].min
      length = (i - j).abs
      square = height * length

      max_square = square if max_square < square
    end
  end
  max_square
end

# o(n)
# o(1)
def max_area(heights)
  start_index = 0
  end_index = heights.size - 1
  max_square = 0

  while start_index < end_index
    height = [heights[start_index], heights[end_index]].min
    length = (start_index - end_index).abs
    square = height * length

    max_square = [max_square, square].max

    if heights[start_index] >= heights[end_index]
      end_index -= 1
    else
      start_index += 1
    end
  end
  max_square
end

p max_area([1,8,6,2,5,4,8,3,7])
