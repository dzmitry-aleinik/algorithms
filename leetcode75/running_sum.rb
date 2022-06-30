# @param {Integer[]} nums
# @return {Integer[]}

#Input: nums = [1,2,3,4]
#Output: [1,3,6,10]
#Explanation: Running sum is obtained as follows: [1, 1+2, 1+2+3, 1+2+3+4].


def running_sum(nums)
  nums.each.with_index do |_num, i|
    next if i.zero?

    nums[i] = nums[i] + nums[i - 1]
  end
end

p running_sum([1,2,3,4])
