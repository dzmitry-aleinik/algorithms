def max_area(heights)
  left = 0
  right = heights.size - 1
  max_square = 0
  while left < right
    current_square = (right - left) * [heights[left], heights[right]].min
    max_square = [max_square, current_square].max
    if heights[left] < heights[right]
      left += 1
    else
      right -= 1
    end
  end
  max_square
end

p max_area([1,8,6,2,5,4,8,3,7])


def three_sum(nums)
  sum_map = {}
  result = []
  dupplicated = {}

  (0..nums.size - 1).each do |i|
    next if dupplicated[[i]]

    ((i+1)..nums.size - 1).each do |j|
      complement = -(nums[i] + nums[j])

      if sum_map[complement]
        result << [nums[i], nums[j], complement]
      end
      sum_map[nums[j]] = true
    end
    dupplicated[nums[i]] = true
    sum_map = {}
  end
  result
end

def filter_triplets(triplets)
  result = []
  triplets.each do |triplet|
    if result.empty?
      result << triplet
      next
    end

    result << triplet if result.none? { |tr| equal_triplet?(tr, triplet) }
  end
  result
end

def equal_triplet?(triplet_one, triplet_two)
  triplet_one.all? { |char| triplet_two.include?(char) }
end