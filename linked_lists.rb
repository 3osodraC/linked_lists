# Adds a linked list, a list of values scattered throughout memory.
class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  # Adds a node to the end of the list.
  def append(data)
    if @head.nil?
      prepend(data)
    else
      tmp = Node.new
      tmp = tmp.next_node until tmp.next_node.nil?

      tmp.next_node = Node.new(data, nil)
      @tail = tmp.next_node
    end
  end

  # Adds a node to the start of the list.
  def prepend(data)
    @head = Node.new(data, @head)
  end
end

# Linked list node.
class Node
  attr_accessor :data, :next_node

  def initialize(data = nil, next_node = nil)
    @data = data
    @next_node = next_node
  end
end

# Testing ground ;)
list = LinkedList.new
list.prepend(32)
list.append(64)
p list
