# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}

def cycle?(head)
  visited_nodes = {}

  while head
    return true if visited_nodes[head.object_id]

    visited_nodes[head.object_id] = true
    head = head.next
  end
  false
end

def without_memory_cycle?
end
