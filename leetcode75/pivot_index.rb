# frozen_string_literal: true

# @param {Integer[]} nums
# @return {Integer}

# Input: nums = [1,7,3,6,5,6]
# Output: 3
# Explanation:
# The pivot index is 3.
# Left sum = nums[0] + nums[1] + nums[2] = 1 + 7 + 3 = 11
# Right sum = nums[4] + nums[5] = 5 + 6 = 11

# Input: nums = [1,7,3,6,5,6]
#  [0,1,8,11,17,22]

#  [0,6, 11, 17, 20, 27]

# [27, 20, 17, 11, 6,   0]
# [0,   1,  8, 11, 17, 22]

#  [2 0 4 1 1]
#  [0 2 2 6 7]
#   [6 6 2 1 0]
#  [0 1 2 6 6]
#


# o(n^2)
# o(1) space
def pivot_index_v2(nums)
  left_sum = 0
  (0..nums.size - 1).each do |i|
    right_sum = 0

    ((i + 1)..nums.size - 1).each do |j|
      right_sum += nums[j]
    end

    return i if left_sum == right_sum

    left_sum += nums[i]
  end
  -1
end


# o(n)
# o(n) space
def sums_before_each_element(nums)
  sum = 0
  result = []
  nums.each do |num|
    result << sum
    sum = num + sum
  end
  result
end

def pivot_index(nums)
  sums_left = sums_before_each_element(nums)
  sums_right = sums_before_each_element(nums.reverse)
  sums_right = sums_right.reverse

  sums_left.each_index do |index|
    return index if sums_left[index] == sums_right[index]
  end
  -1
end


def pivot_index_final(nums)
  sum = nums.sum
  left_sum = 0
  nums.each.with_index do |num, index|
    return index if left_sum == sum - num - left_sum

    left_sum += num
  end
  return -1
end
