
class ListNode
  attr_accessor :val, :next
  def initialize(val, n = nil)
    @val = val
    @next = n
  end
end

# @param {ListNode} head
# @return {ListNode}

def detectCycle(head)
  visited = {}
  current = head
  while current
    return current if visited[current.object_id]

    visited[current.object_id] = counter
    counter += 1
    current = current.next
  end
  -1
end

#floyd algorthm
def detect_cycle(head)
  intercsection = cycle?(head)
  return nil unless intercsection

  start_pointer = head
  intercsection_pointer = intercsection

  while start_pointer != intercsection_pointer
    intercsection_pointer = intercsection_pointer.next
    start_pointer = start_pointer.next
  end

  start_pointer
end

def cycle?(head)
  slow_pointer = head
  fast_pointer = head
  while slow_pointer && fast_pointer
    slow_pointer = slow_pointer.next
    fast_pointer = fast_pointer.next&.next

    return slow_pointer if slow_pointer == fast_pointer
  end
  nil
end

fourth = ListNode.new(4)
third = ListNode.new(3, fourth)
second = ListNode.new(2, third)
first = ListNode.new(1, second)
fourth.next = second

p detect_cycle(first).val
