# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  number_to_indexes = {}

  (0..nums.size - 1).each do |i|
    if number_to_indexes[target - nums[i]]
      return [number_to_indexes[target - nums[i]], i]
    end

    number_to_indexes[nums[i]] = i
  end
  return -1
end


# [2,7,11,15], target = 9

p two_sum([2,7,11,15], 9)