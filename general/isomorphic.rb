# frozen_string_literal: true

# @param {String} s
# @param {String} t
# @return {Boolean}

=begin 

Input: s = "egg", t = "add"
Output: true

Input: s = "foo", t = "bar"
Output: false

Input: s = "paper", t = "title"
Output: true
=end

def isomorphic?(str1, str2)
  return false unless str1.length == str2.length

  dictionary = {}
  reverse_dictionary = {}

  (0..str1.length - 1).each do |index|
    char1 = str1[index]
    char2 = str2[index]

    return false if dictionary[char1] && dictionary[char1] != char2
    return false if reverse_dictionary[char2] && reverse_dictionary[char2] != char1

    dictionary[char1] = char2
    reverse_dictionary[char2] = char1
  end
  true
end

p isomorphic?("foo", "bar")
