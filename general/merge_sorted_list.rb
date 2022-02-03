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
  return nil if !list1 && !list2
  return list1 unless list2
  return list2 unless list1

  prehead = ListNode.new
  prev = prehead

  while list1 && list2
    if list1.val < list2.val
      prev.next = list1
      list1 = list1.next
    else
      prev.next = list2
      list2 = list2.next
    end
    prev = prev.next
  end

  prev.next = list1.nil? ? list2 : list1
  prehead.next
end
