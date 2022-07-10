# frozen_string_literal: true

#
# You are given two non-empty linked lists representing two non-negative integers.
# The digits are stored in reverse order, and each of their nodes contains a single digit.
#  Add the two numbers and return the sum as a linked list.
#
# You may assume the two numbers do not contain any leading zero, except the number 0 itself.
#
# Input: l1 = [2,4,3], l2 = [5,6,4]
# Output: [7,0,8]
# Explanation: 342 + 465 = 807.

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
 end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

def add_two_numbers(list1, list2)
  list1_pointer = list1
  list2_pointer = list2

  prev_result_node = nil
  shift = 0
  result_head = nil

  while list1_pointer || list2_pointer || shift > 0
    list1_node_value = list1_pointer&.val || 0
    list2_node_value = list2_pointer&.val || 0

    result_node = ListNode.new
    result_head ||= result_node

    result_node.val = (list1_node_value + list2_node_value + shift) % 10

    shift = (list1_node_value + list2_node_value + shift) / 10

    prev_result_node.next = result_node if prev_result_node
    prev_result_node = result_node

    list1_pointer = list1_pointer&.next
    list2_pointer = list2_pointer&.next
  end
  result_head
end
