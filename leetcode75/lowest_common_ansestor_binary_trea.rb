# frozen_string_literal: true

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}

# first version iterative
def lowest_common_ancestor(root, p, q)
  first_search_node = root
  second_search_node = root
  common = nil

  while first_search_node.val != p.val || second_search_node.val != q.val

    if first_search_node.val == second_search_node.val
      common = first_search_node
    else 
      return common
    end

    if p.val > first_search_node.val
      first_search_node = first_search_node.right
    elsif p.val < first_search_node.val
      first_search_node = first_search_node.left
    end

    if q.val > second_search_node.val
      second_search_node = second_search_node.right
    elsif q.val < second_search_node.val
      second_search_node = second_search_node.left
    end
  end
  common
end

# first version iterative
# return current_node when p and q in different subtrees 
def lowest_common_ancestor(root, p, q)
  current_node = root

  while current_node
    if current_node.val > p.val && current_node.val > q.val
      current_node = current_node.left
    elsif current_node.val < p.val && current_node.val < q.val
      current_node = current_node.right
    else
      return current_node
    end
  end
  current_node
end

def lowest_common_ancestor(current_node, p, q)
  return unless current_node

  if current_node.val > p.val && current_node.val > q.val
    res = lowest_common_ancestor(current_node.left, p, q)
  elsif current_node.val < p.val && current_node.val < q.val
    res = lowest_common_ancestor(current_node.right, p, q)
  else
    return current_node
  end

  res
end
