#Given a string s, find the length of the longest substring without repeating characters.


=begin Example 1:

Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.
Example 2:

Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
Example 3:

Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
=end

# @param {String} s
# @return {Integer}

def length_of_longest_substring(s)
  char_occurences = {}
  max_length = 0
  i = 0
  while i < s.length
    char = s[i]

    if char_occurences[char]
      i = char_occurences[char] + 1
      char_occurences = {}
    else
      char_occurences[char] = i
      i += 1
    end

    max_length = [max_length, char_occurences.keys.size].max
  end
  max_length
end

p length_of_longest_substring('pwwkews')
