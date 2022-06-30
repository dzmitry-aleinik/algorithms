# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}

def merge_two_lists(list1, list2)
  if list1.nil? || list2.nil?
    return list1 || list2
  end

  if list1.val <= list2.val
    merged_head = ListNode.new(list1.val)
    list1 = list1.next
  else 
    merged_head = ListNode.new(list2.val)
    list2 = list2.next
  end

  current_merged = merged_head

  while list1 && list2
    if list1.val <= list2.val
      current_merged.next = list1
      list1 = list1.next
    else
      current_merged.next = list2
      list2 = list2.next
    end
    current_merged = current_merged.next
  end

  current_merged.next = list1 || list2
  merged_head
end
