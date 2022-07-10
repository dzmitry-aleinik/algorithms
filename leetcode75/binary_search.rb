# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}


=begin
Input: nums = [-1,0,3,5,9,12], target = 9
Output: 4
Explanation: 9 exists in nums and its index is 4
=end

def search(nums, target)
  left_border = 0
  right_border = nums.size - 1

  while left_border <= right_border
    middle = left_border + (right_border - left_border)/2
    return middle if nums[middle] == target

    if target < nums[middle]
      right_border = middle - 1
    else
      left_border = middle + 1
    end
  end
  -1
end
