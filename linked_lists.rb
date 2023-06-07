# Adds a linked list, a list of values scattered throughout memory.
class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  # Adds a node to the end of the list.
  # - Checks if @head is nil, adds a node there if it is.
  # - Checks if @tail is nil, it means there's only one node. Creates new
  # node and assigns it to @tail. Updates @head's next_node to @tail.
  # - If both cases are false, there's >1 node. Creates new node and sets it as
  # the current @tail's next_node, then assigns the new node to @tail.
  def append(data)
    if @head.nil?
      prepend(data)
    elsif @tail.nil?
      @tail = Node.new(data, nil)
      @head.next_node = @tail
    else
      new_node = Node.new(data, nil)
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  # Adds a node to the start of the list.
  def prepend(data)
    @head = Node.new(data, @head)
  end

  # Returns linked list size.
  def size
    current = @head
    size = 0
    until current.nil?
      current = current.next_node
      size += 1
    end
    size
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
p list.size
list.prepend(32)
p list.size
list.append(64)
p list
p list.size
