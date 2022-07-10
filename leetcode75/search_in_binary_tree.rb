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
# @param {Integer} val
# @return {TreeNode}


#recursion
def search_bst(root, val)
  return unless root

  if val > root.val
    search_bst(root.right, val)
  elsif val == root.val
    return root
  else
    search_bst(root.left, val)
  end
end


#iteration
def search_bst(root, val)
  stack = [].push(root)

  until stack.empty?
    node = stack.pop
    return nil unless node
    return node if val == node.val

    if val > node.val
      stack.push(node1.right)
    else
      stack.push(node.left)
    end
  end
  nil
end
