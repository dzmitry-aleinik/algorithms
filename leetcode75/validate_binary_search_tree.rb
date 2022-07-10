# frozen_string_literal: true

#Given the root of a binary tree, determine if it is a valid binary search tree (BST).
#https://leetcode.com/problems/validate-binary-search-tree/

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Boolean}

#recursion
def is_valid_bst(root, low_limit: nil, upper_limit: nil)
  return true unless root
  return false if low_limit && root.val <= low_limit
  return false if upper_limit && root.val >= upper_limit

  is_valid_bst(root.left, low_limit: low_limit, upper_limit: root.val) &&
    is_valid_bst(root.right, low_limit: root.val, upper_limit: upper_limit)
end

def add_node(node, stack, low_limits, upper_limits)
  stack.push(node)
  low_limits.push(node)
  upper_limits.push(node)
end

#iterative
def is_valid_bst(root)
  stack = [].push(root)
  low_limits = []
  upper_limits = []

  until stack.empty?
    node = stack.pop

    low_limit = low_limits.pop
    upper_limit = upper_limits.pop

    return false if low_limit && node.val <= low_limit

    return false if upper_limit && node.val >= upper_limit

    if node.left
      stack.push(node.left)
      low_limits.push(low_limit)
      upper_limits.push(node.val)
    end

    if node.right
      stack.push(node.right)
      low_limits.push(node.val)
      upper_limits.push(upper_limit)
    end
  end
  true
end
