# Example 1:
#
# Input: s = "cbaebabacd", p = "abc"
# Output: [0,6]
# Explanation:
# The substring with start index = 0 is "cba", which is an anagram of "abc".
# The substring with start index = 6 is "bac", which is an anagram of "abc".

def letter_counter(str)
  res = {}
  str.each_char do |char|
    res[char] ||= 0
    res[char] += 1
  end
  res
end

def is_anagram(s, t)
  letter_counter(s).eql?(letter_counter(t))
end

def find_anagrams(s, p)
  search_length = p.length
  anagrams_start_indexes = []
  (0..s.length - 1).each do |start_index|
    break if start_index + search_length >= s.length

    if is_anagram(p, s[start_index, search_length])
      anagrams_start_indexes << start_index
    end
  end
  anagrams_start_indexes
end

p find_anagrams('cbaebabacd', 'abc')
