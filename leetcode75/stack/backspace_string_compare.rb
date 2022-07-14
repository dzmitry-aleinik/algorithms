# @param {String} s
# @param {String} t
# @return {Boolean}

#Input: s = "ab#c", t = "ad#c"

def build_str(str_with_backspace)
  stack = []
  str_with_backspace.each_char do |char|
    if char == '#'
      stack.pop
    else
      stack.push(char)
    end
  end
  stack
end

def backspace_compare(first_str, second_str)
  build_str(first_str) == build_str(second_str)
end
s = "ab##c"
 t = "d#c"

p backspace_compare(s, t)
