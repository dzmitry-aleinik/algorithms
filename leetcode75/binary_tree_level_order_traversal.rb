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
# @return {Integer[][]}


#Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).


# bfs saving heights
def level_order(root)
  return []  unless root

  result = []
  heights = {}

  queue = [].push(root)
  heights[root] = 0

  until queue.empty?
    node = queue.shift
    next unless node

    node_height = heights[node]

    result[node_height] ||= []
    result[node_height].push(node.val)

    if node.left
      queue.push(node.left)
      heights[node.left] = node_height + 1
    end

    if node.right
      queue.push(node.right)
      heights[node.right] = node_height + 1
    end
  end
    result
end

# second version
def level_order(root)
  return [] unless root

  result = []
  queue = [].push(root)
  level = 0

  until queue.empty?
    (0..queue.size - 1).each do |_i|
      node = queue.shift

      result[level] ||= []
      result[level].push(node.val)

      queue.push(node.left) if node.left
      queue.push(node.right) if node.right
    end
    level += 1
  end
  result
end
