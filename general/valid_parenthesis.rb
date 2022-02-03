# https://leetcode.com/problems/valid-parentheses/
# Input: s = "()"
# Output: true
#
# Input: s = "()[]{}"
# Output: true
#
# Input: s = "(]"
# Output: false

OPEN_PAR = ['(', '{', '['].freeze

OPEN_BY_CLOSE = {
  ')' => '(',
  '}' => '{',
  ']' => '['
}.freeze

CLOSE_PAR = OPEN_BY_CLOSE.keys

def is_valid(str)
  stack = []
  str.each_char do |char|
    if OPEN_PAR.include?(char)
      stack.push(char)
    else
      prev_char = stack.pop

      return false if prev_char != OPEN_BY_CLOSE[char]
    end
  end
  stack.empty?
end

p is_valid('(')
