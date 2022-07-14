# @param {String} num1
# @param {String} num2
# @return {String}


=begin
Given two non-negative integers num1 and num2 represented as strings,
return the product of num1 and num2, also represented as a string.

Note: You must not use any built-in BigInteger library or convert the inputs to integer directly.
=end

def sum(num1, num2)
  pointer = 0
  num1 = num1.reverse
  num2 = num2.reverse
  shift = 0

  result = ''
  while pointer < num1.size || pointer < num2.size || shift != 0
    first_number_digit = num1[pointer] || 0
    second_number_digit = num2[pointer] || 0

    result_number_digit = (first_number_digit.to_i + second_number_digit.to_i + shift) % 10
    shift = (first_number_digit.to_i + second_number_digit.to_i + shift) / 10
    result << result_number_digit.to_s
    pointer += 1
  end
  result.reverse
end

def multiply_single_digit_and_number(digit_char, number)
  return '0' if digit_char == '0'
  digit = digit_char.to_i
  shift = 0
  result = ''
  number.reverse.each_char do |second_namber_char_digit|
    result_digit = (digit * second_namber_char_digit.to_i + shift) % 10
    shift = (digit * second_namber_char_digit.to_i + shift) / 10
    result << result_digit.to_s
  end
  result << shift.to_s if shift > 0
  result.reverse
end

#p multiply_single_digit_and_number('7', '123132135') == '861924945'
#p multiply_single_digit_and_number('4', '0')


#p sum('000', '19')

def multiply(num1, num2)
  return '0' if num1 == '0' || num2 == '0'

  degree = 0
  result = '0'

  num1.reverse.each_char do |first_number_digit|
    single_result = multiply_single_digit_and_number(first_number_digit, num2)
    (0..degree - 1).each do
      single_result << '0'
    end
    p single_result

    result = sum(single_result, result)
    degree += 1
  end
  result
end

p multiply('123', '456')

56088
