# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}


=begin 
Input: head = [1,2,3,4,5]
Output: [5,4,3,2,1]
=end

def reverse_list(head)
  current = head
  prev = nil

  while current
    next_node = current.next
    current.next = prev
    prev = current
    current = next_node
  end
  head
end

def reverse_list_recurse(current, prev = nil)
  return prev if current.nil?

  next_node = current.next
  current.next = prev

  reverse_list_recurse(next_node, current)
end
