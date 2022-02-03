# Example 1:
#
# Input: s = "anagram", t = "nagaram"
# Output: true
# Example 2:
#
# Input: s = "rat", t = "car"
# Output: false


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

p is_anagram('anagram', 'nagaram')
