class MinStack
  def initialize
    @stack = []
    @min = []
  end

  #   :type val: Integer
  #   :rtype: Void
  def push(val)
    @stack.push(val)
    @min.push(val) if @min.empty? || val <= @min.last
  end

  #   :rtype: Void
  def pop
    poped_value = @stack.pop
    @min.pop if @min.last == poped_value
  end

  #   :rtype: Integer
  def top
    @stack.last
  end

  #   :rtype: Integer
  def get_min
    @min.last
  end
end

# Your MinStack object will be instantiated and called as such:
# obj = MinStack.new()
# obj.push(val)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.get_min()



=begin MinStack minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.getMin(); // return -3
minStack.pop();
minStack.top();    // return 0
minStack.getMin(); // return -2 =end
