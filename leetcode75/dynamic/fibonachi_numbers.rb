# @param {Integer} n
# @return {Integer}


# recursive
def fib(n)
  return 0 if n == 0 
  return 1 if n == 1

  fib(n - 2) + fib(n - 1)
end


# recursive with memo
def fib(n, cache = {})
  return 0 if n == 0 
  return 1 if n == 1
  return cache[n] if cache[n]

  cache[n - 1] = fib(n - 1)
  cache[n - 2] = fib(n - 2)

  cache[n - 1] + cache[n - 2]
end

# iterative
def fib(n)
  return 0 if n == 0
  return 1 if n == 1

  sequance = [0, 1]

  (2..n).each do |index|
    sequance[index] = sequance[i - 1] + sequance[i - 2] 
  end
  sequance[n]
end

p fib(6)
