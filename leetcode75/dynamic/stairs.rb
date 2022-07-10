# @param {Integer} n
# @return {Integer}


#recursion with memo
def climb_stairs(n, cache = {})
  return 0 if n < 0
  return 1 if n == 0
  return cache[n] if cache[n]

  cache[n] = climb_stairs(n - 2, cache) + climb_stairs(n - 1, cache)
  cache[n]
end



# itetative 
# dynamic programming
# F(n) - number of ways for n stairs 
# F(n) = F(n-1) + F(n-2)

def climb_stairs(n)
  return 0 if n == 0
  return 1 if n == 1
  return 2 if n == 2

  sequance = [0, 1, 2]

  (2..n).each do |i|
    sequance[i] = sequance[i - 1] + sequance[i - 2]
  end
  sequance[n]
end





