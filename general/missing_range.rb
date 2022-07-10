# @param {Integer[]} nums
# @param {Integer} lower
# @param {Integer} upper
# @return {String[]}


=begin 
Input: nums = [0,1,3,50,75], lower = 0, upper = 99
Output: ["2","4->49","51->74","76->99"]
Explanation: The ranges are:
[2,2] --> "2"
[4,49] --> "4->49"
[51,74] --> "51->74"
[76,99] --> "76->99"
=end


def find_missing_ranges(nums, lower, upper)
  result = []

  if nums.empty?
    return [lower.to_s] if lower - upper == 0

    return ["#{lower}->#{upper}"]
  end

  if nums[0] - lower == 1
    result << lower.to_s
  elsif nums[0] - lower > 1
    result << "#{lower}->#{nums[0] - 1}"
  end

  (0..nums.size - 2).each do |index|
    set_range(nums[index], nums[index + 1], result)
  end

  if upper - nums.last == 1
    result << upper.to_s
  elsif upper - nums.last > 1
    result << "#{nums.last + 1}->#{upper}"
  end

  result
end

def set_range(num1, num2, result)
  if num2 - num1 == 2
    result << (num1 + 1).to_s
  elsif num2 - num1 > 2
    result << "#{num1 + 1}->#{num2 - 1}"
  end
end


p find_missing_ranges([-1], -1, -1)
