
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

leg = AgentLeg.find(agent_leg_id)
path = "/voice/calls/update_status"
binding.pry
res = post(
 path,
 params: { 'event' =>'end', "call_id"=> leg.id },
 headers: twilio_authentication_headers,
)
binding.pry

# Input: head = [1,1,2,3,3]
# Output: [1,2]

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

node3 = ListNode.new(3)
node2 = ListNode.new(1, node3)
node1 = ListNode.new(1, node2)


def print_list(head)
  current = head
  result = ''
  while current 
    result << "#{current.val} -> "
    current = current.next
  end
  p result
end


def delete_duplicates(head)
  current = head
  first_element_occurence = head

  while current

    if current.next&.val != first_element_occurence.val

      if first_element_occurence != current
        first_element_occurence.next = current.next
      end
      first_element_occurence = current.next
    end

    current = current.next
  end
end

print_list(node1)


delete_duplicates(node1)

print_list(node1)

