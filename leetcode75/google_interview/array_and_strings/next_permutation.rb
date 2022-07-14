# frozen_string_literal: true

# A permutation of an array of integers is an arrangement of its members into a sequence or linear order.
#
# For example, for arr = [1,2,3], the following are considered permutations of arr: [1,2,3], [1,3,2], [3,1,2], [2,3,1].
#

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.

#
# Example 1:
#
# Input: nums = [1,2,3]
# Output: [1,3,2]
# Example 2:
#
# Input: nums = [3,2,1]
# Output: [1,2,3]
# Example 3:
#
# Input: nums = [1,1,5]
# Output: [1,5,1]

def next_permutation(nums)
  i = nums.size - 1

  first_left_not_ascending_index = nil

  while i > 0
    if nums[i] > nums[i - 1]
      first_left_not_ascending_index = i - 1
      break
    end
    i -= 1
  end

  return nums.reverse! unless first_left_not_ascending_index

  j = nums.size - 1

  while nums[first_left_not_ascending_index] >= nums[j] && j > first_left_not_ascending_index
    j -= 1
  end

  swap(nums, first_left_not_ascending_index, j)

  left = first_left_not_ascending_index + 1
  right = nums.size - 1
  while left < right
    swap(nums, left, right)
    left += 1
    right -= 1
  end
  nums 
end

def swap(nums, i, j)
  buf = nums[i]
  nums[i] = nums[j]
  nums[j] = buf
end

#p next_permutation([4, 2, 0, 2, 3, 2, 0])
p next_permutation([2,3,1,3,3])
#                  [4, 2, 0, 3, 2, 2, 0]

#[2,3,1,3,3]

