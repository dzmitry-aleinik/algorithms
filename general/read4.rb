# frozen_string_literal: true

# The read4 API is already defined for you.
# Below is an example of how the read4 API can be called.
# file = File.new("abcdefghijk") File is "abcdefghijk", initially file pointer (fp) points to 'a'
# buf4 = [' '] * 4 Create buffer with enough space to store characters
# read4(buf4) # read4 returns 4. Now buf = ['a','b','c','d'], fp points to 'e'
# read4(buf4) # read4 returns 4. Now buf = ['e','f','g','h'], fp points to 'i'
# read4(buf4) # read4 returns 3. Now buf = ['i','j','k',...], fp points to end of file

# @param {List[str]} buf
# @param {int} n
# @return {int}

# "abc"
# 4
def read(buf, n)
  buf4 = []
  counter = 0
  read4_counter = read4(buf4)
  write_to_buf(buf, buf4, counter)
  counter = read4_counter
  while counter < n && read4_counter > 0
    read4_counter = read4(buf4)
    if counter + read4_counter > n
      write_to_buf(buf, buf4[0..n-counter - 1], counter)
    else
      write_to_buf(buf, buf4, counter)
    end
    counter += read4_counter
  end
  counter
end

def write_to_buf(buf, source, shift)
  j = 0
  (shift..(shift + source.size - 1)).each do |i|
    buf[i] = source[j]
    j += 1
  end
end

# "leetcode"
# 5

a = ['a', 'b', '', '', '']
write_to_buf(a, 'cd', 2)
p a

# #"abcde"
# 5
