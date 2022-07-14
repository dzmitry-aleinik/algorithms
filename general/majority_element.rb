# frozen_string_literal: true

# @param {Integer[]} nums
# @return {Integer}
# Given an array nums of size n, return the majority element.
# The majority element is the element that appears more than ⌊n / 2⌋ times.
# You may assume that the majority element always exists in the array.
# Input: nums = [2,2,1,1,1,2,2]
# Output: 2

def majority_element(nums)
  occurences_counter = {}

  nums.each do |number|
    occurences_counter[number] ||= 0
    occurences_counter[number] += 1
  end

  major_count = 0
  major = 0

  occurences_counter.each do |number, occurences_count|
    if occurences_count > major_count
      major_count = occurences_count
      major = number
    end
  end

  major
end

#complexity o(n)
#space o(1)
def majority_element_v2(nums)
  major = 0
  major_counter = 0

  nums.each do |number|
    major = number if major_counter.zero?

    major == number ? major_counter += 1 : major_counter -= 1
  end

  major
end


p majority_element([2, 2, 1, 1, 1, 2, 2])
