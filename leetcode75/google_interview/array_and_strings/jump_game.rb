# @param {Integer[]} nums
# @return {Boolean}


=begin 
You are given an integer array nums. You are initially positioned at the array's first index, and each element in the array represents your maximum jump length at that position.

Return true if you can reach the last index, or false otherwise.

 

Example 1:

Input: nums = [2,3,1,1,4]
Output: true
Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
Example 2:

Input: nums = [3,2,1,0,4]
Output: false
Explanation: You will always arrive at index 3 no matter what.
Its maximum jump length is 0, which makes it impossible to reach the last index.
=end

def can_pass_through_zero?(nums, zero_index)
  jumps_to_pass_zero = zero_index == (nums.size - 1) ? 1 : 2

  i = zero_index - 1

  while i >= 0
    return true if nums[i] >= jumps_to_pass_zero

    jumps_to_pass_zero += 1
    i -= 1
  end
  false
end

def can_jump(nums)
  return true if nums.size <= 1

  (0..nums.size - 1).each do |i|
    next if nums[i] != 0

    return false unless can_pass_through_zero?(nums, i)
  end
  true
end

p can_jump([0, 0])
