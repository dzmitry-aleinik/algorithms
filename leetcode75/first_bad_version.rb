# frozen_string_literal: true

# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):

# @param {Integer} n
# @return {Integer}

# You are a product manager and currently leading a team to develop a new product.
# Unfortunately, the latest version of your product fails the quality check.
# Since each version is developed based on the previous version, all the versions after a bad version are also bad.
#
# Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one,
# which causes all the following ones to be bad.
#
# You are given an API bool isBadVersion(version) which returns whether version is bad.
# Implement a function to find the first bad version. You should minimize the number of calls to the API.
def first_bad_version(n)
  left_border = 1
  right_border = n

  while left_border <= right_border
    middle = left_border + (right_border - left_border) / 2

    is_middle_bad = isBadVersion(middle)

    if !is_middle_bad
      left_border = middle + 1
    elsif is_middle_bad && ( middle == 0 || !isBadVersion(middle - 1))
      return middle
    else
      right_border = middle - 1
    end
  end
end


def first_bad_version(n)
  left_border = 1
  right_border = n

  while left_border < right_border
    middle = left_border + (right_border - left_border) / 2

    is_middle_bad = isBadVersion(middle)

    if !is_middle_bad
      left_border = middle + 1
    else
      right_border = middle
    end
  end
  left_border
end
