require 'pry'

# @param {String} s
# @param {String} t
# @return {Boolean}

=begin
Example 1:

Input: s = "abc", t = "ahbgdc"
Output: true
Example 2:

Input: s = "axc", t = "ahbgdc"
Output: false
=end

def is_subsequence(str1, str2)
  start_index = 0
  found_index = 0

  str1.chars.each_index do |i|
    found = false
    (start_index..(str2.length - 1)).each do |j|
      next unless str2[j] == str1[i]

      start_index = j + 1
      found = true
      break
    end
    return false unless found
  end
  true
end

p is_subsequence('axc', 'ahbgdc')