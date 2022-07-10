
# @param {Integer} column_number
# @return {String}

#
# A -> 1
# B -> 2
# C -> 3
# ...
# Z -> 26
# AA -> 27
# AB -> 28
#
ALPHABET_SIZE = 26
ASCII_START = 65

def convert_to_title(column_number)
  result = ''
  while column_number.positive?
    char_shift = (column_number - 1) % ALPHABET_SIZE
    column_number = (column_number-1)/ALPHABET_SIZE
    result = result << (ASCII_START + char_shift).chr
  end
  result.reverse
end

p convert_to_title(26)
p convert_to_title(701)
p convert_to_title(702)
p convert_to_title(703)
p convert_to_title(704)
