# Definition for a Node.
# class Node
#     attr_accessor :val, :children
#     def initialize(val)
#         @val = val
#         @children = []
#     end
# end

# @param {Node} root
# @return {List[int]}
#recursive
def preorder(root, result = [])
  return result unless root

  result << root.val
  root.children.each { |child| preorder(child, result) }
  result
end
#iterative
def preorder(root)
  return [] unless root

  result = []
  stack = []
  stack.push(root)

  until stack.empty?
    node = stack.pop
    result << node.val

    node.children.reverse.each do |child|
      stack.push(child)
    end
  end
  result
end

preorder(nil)
