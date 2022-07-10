=begin
Example 1:
  Input: s = "abccccdd"
  Output: 7
  Explanation: One longest palindrome that can be built is "dccaccd", whose length is 7.
  Example 2:

  Input: s = "a"
  Output: 1
  Explanation: The longest palindrome that can be built is "a", whose length is 1.
=end

# @param {String} s
# @return {Integer}

# alg o(n)
# memory o(1) number of the keys not bigger than 52
def longest_palindrome(chars)
  char_occurrences = {}
  chars.each_char do |char|
    char_occurrences[char] ||= 0
    char_occurrences[char] += 1
  end

  palindrome_count = 0
  char_occurrences.each do |_char, occurrences_number|
    if occurrences_number.even?
      palindrome_count += occurrences_number
    else
      palindrome_count += (occurrences_number - 1)
    end
  end

  if palindrome_count < chars.size
    palindrome_count + 1
  else
    palindrome_count
  end
end

p longest_palindrome('aaaabbgggcct')