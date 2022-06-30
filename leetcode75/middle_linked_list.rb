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

def middle_node(head)
  slow_pointer = head
  fast_pointer = head

  while slow_pointer && fast_pointer&.next
    slow_pointer = slow_pointer.next
    fast_pointer = fast_pointer.next&.next
  end

  slow_pointer
end
