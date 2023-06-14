# Adds a linked list, a list of values scattered throughout memory.
class LinkedList
  attr_reader :head, :tail

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

  # Returns the node at a specific index by traversing the list and returning
  # the current node when i = the specified index.
  def at(index)
    raise 'Invalid index.' if index > size - 1 || index.negative?

    current = @head
    i = 0
    until i == index
      current = current.next_node
      i += 1
    end
    current
  end

  # Retunrs true if value is found, false if not.
  def contains?(value)
    current = @head
    until current.nil?
      return true if current.data == value

      current = current.next_node
    end
    false
  end

  # Returns index of the specified value, returns nil if it's not found.
  def find(value)
    current = @head
    index = 0
    until current.nil?
      return index if current.data == value

      current = current.next_node
      index += 1
    end
    nil
  end

  # Adds a node to the start of the list.
  def prepend(data)
    @head = Node.new(data, @head)
  end

  # Returns linked list size by adding 1 to the counter until the current
  # node's next_node is nil, then it returns counter (size).
  def size
    current = @head
    size = 0
    until current.nil?
      current = current.next_node
      size += 1
    end
    size
  end

  # Returns a string version of the list.
  def to_s
    string = ''
    current = @head
    until current.nil?
      string << "( #{current.data} ) -> "

      current = current.next_node
      string << "nil" if current.nil?
    end
    string
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

puts "Linked Lists!\nThe list is currently empty. let's check its size: #{list.size}
\nLet's add 32 to the start and check its size again."
list.prepend(32)

puts "Size: #{list.size}
\nLet's add 64 to the end of the list and check its size again."
list.append(64)

puts "Size: #{list.size}\nNow let's check the other class methods!"

puts "\nhead: #{list.head}\ntail: #{list.tail}\nat 0: #{list.at(0)}\nat 1: #{list.at(1)}
\ncontains? 64: #{list.contains?(64)}\ncontains? 999: #{list.contains?(999)}
\nfind 64: #{list.find(64)}\nto_s: #{list.to_s}"
