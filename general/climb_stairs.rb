
# https://leetcode.com/problems/climbing-stairs/
# Input: n = 3
# Output: 3

def climb_stairs(n)
  cache = {}
  stairs(n, cache)
end



def stairs(n, cache)
  return 1 if n == 0
  return 0 if n < 0

  cache[n - 1] ||= stairs(n - 1, cache)
  cache[n - 2] ||= stairs(n - 2, cache)

  cache[n - 1] + cache[n - 2]
end

p climb_stairs(4)
