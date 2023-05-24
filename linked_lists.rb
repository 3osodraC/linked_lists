# Adds a linked list, a list of values scattered throughout memory.
class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(data)
    if @head == nil
      prepend(data)
    else
      # (TODO) append new data
    end
  end

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
