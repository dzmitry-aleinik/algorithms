=begin 
Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

Notice that the solution set must not contain duplicate triplets.
=end

=begin 
Input: nums = [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]
=end

# @param {Integer[]} nums
# @return {Integer[][]}

def three_sum(nums)
  sum_map = {}
  result = []
  dupplicated = {}

  (0..nums.size - 1).each do |i|
    next if dupplicated[[i]]

    ((i+1)..nums.size - 1).each do |j|
      complement = -(nums[i] + nums[j])

      if sum_map[complement]
        result << [nums[i], nums[j], complement]
      end
      sum_map[nums[j]] = true
    end
    dupplicated[nums[i]] = true
    sum_map = {}
  end
  filter_triplets(result)
end

def filter_triplets(triplets)
  result = []
  triplets.each do |triplet|
    if result.empty?
      result << triplet
      next
    end

    result << triplet if result.none? { |tr| equal_triplet?(tr, triplet) }
  end
  result
end

def equal_triplet?(triplet_one, triplet_two)
  triplet_one.all? { |char| triplet_two.include?(char) }
end
#Input: nums = [-1,0,1,2,-1,-4]
#Output: [[-1,-1,2],[-1,0,1]]
nums = [1,2,-2,-1]
#nums = [-1,0,1,2,-1,-4]

p three_sum(nums)