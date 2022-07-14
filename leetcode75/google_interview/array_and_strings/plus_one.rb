# frozen_string_literal: true

# @param {Integer[]} digits
# @return {Integer[]}
#
# You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.
#
# Increment the large integer by one and return the resulting array of digits.

# Input: digits = [1,2,3]
# Output: [1,2,4]
# Explanation: The array represents the integer 123.
# Incrementing by one gives 123 + 1 = 124.
# Thus, the result should be [1,2,4].

def plus_one(digits)
  shift = 1
  digits = digits.reverse

  (0..digits.size - 1).each do |index|
    new_number = (digits[index] + shift) % 10
    shift = (digits[index] + shift) / 10
    digits[index] = new_number

    break if shift == 0
  end

  digits << 1 if shift > 0
  digits.reverse
end

p plus_one([0])
