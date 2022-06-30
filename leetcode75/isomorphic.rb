=begin
Input: s = "egg", t = "add"
Output: true
Example 2:

Input: s = "foo", t = "bar"
Output: false
Example 3:

Input: s = "paper", t = "title"
Output: true 
=end

def isomorphic?(str1, str2)
  return false if str1.length != str2.length

  dictionary1 = {}
  dictionary2 = {}

  str1.chars.each_index do |i|
    return false if dictionary1[str1[i]] && dictionary1[str1[i]] != str2[i]
    return false if dictionary2[str2[i]] && dictionary2[str2[i]] != str1[i]

    dictionary1[str1[i]] = str2[i] unless dictionary1[str1[i]]
    dictionary2[str2[i]] = str1[i] unless dictionary2[str2[i]]
  end

  true
end


p isomorphic?('papee', 'title')
