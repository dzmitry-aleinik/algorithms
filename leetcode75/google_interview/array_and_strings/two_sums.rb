# frozen_string_literal: true

# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}

# Input: numbers = [2,7,11,15], target = 9
# Output: [1,2]
# Explanation: The sum of 2 and 7 is 9. Therefore, index1 = 1, index2 = 2. We return [1, 2].

def two_sum(numbers, target)
  left = 0
  right = numbers.size - 1

  while left < right
    return [left + 1, right + 1] if numbers[left] + numbers[right] == target

    if numbers[left] + numbers[right] > target
      right -= 1
    else
      left += 1
    end
  end
end
