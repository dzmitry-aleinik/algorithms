# https://leetcode.com/problems/maximum-subarray/ easy
# Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
# Output: 6

# Input: nums = [5,4,-1,7,8]
# Output: 23


# comlexity o(n)
# space o(n)
def max_subarray(array)
  current_sum = array[0]
  max_sum = array[0]

  (1..array.size - 1).each do |i|
    current = array[i]

    if current_sum + current > current
      current_sum += current
    else
      current_sum = current
    end

    max_sum = [current_sum, max_sum].max
  end

  max_sum
end
