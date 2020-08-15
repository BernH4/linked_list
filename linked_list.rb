
require 'pry'
# require 'colorize'
require_relative 'node.rb'
# require 'ap'

class LinkedList
  attr_accessor :head, :size
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    node = Node.new(value)
    if head.nil?
      self.head = node
    else
      temp_node = head
      temp_node = temp_node.next until temp_node.next.nil?
      temp_node.next = node
    end
    self.size += 1
  end

  def prepend(value)
    node = Node.new(value)
    node.next = @head
    @head = node
    self.size += 1
  end

  def tail
    node = head
    node = node.next until node.next.nil?
    node
  end

  def at(index)
    idx_counter = 0
    node = head
    until idx_counter == index
      return nil if node.nil?
      node = node.next
      idx_counter += 1
    end
    node
  end

  def pop
    node = head
    node = node.next until node.next.next.nil?
    puts "Node #{node.next} with the value #{node.next.value} will now be deleted!"
    node.next = nil
    self.size -= 1
  end

  def contains?(value)
    node = head
    until node.nil?
      puts node.value
      return true if node.value == value
      node = node.next
    end
    false
  end

  def find(value)
    node = head
    idx = 0
    until node.nil?
      return idx if node.value == value
      node = node.next
      idx += 1
    end
    nil
  end

  def insert_at(value, index)
    if index > self.size - 1
      puts 'Index is higher than existing items, will add it to the end of the list.'
      append(value)
    elsif index.zero? then prepend(value)
    elsif index < self.size
      new_node = Node.new(value)
      idx_iterator = 0
      node = head
      until idx_iterator + 1 == index
        node = node.next
        idx_iterator += 1
      end
      new_node.next = node.next
      node.next = new_node
    else puts 'invalid input'
    end
  end

  def remove_at(index)
    if !(0..self.size - 1).include?(index)
      puts "Invalid index, must be between 0 and #{self.size - 1}."
    elsif index.zero? then self.head = self.head.next
    else
      node = self.head
      idx_iterator = 0
      until idx_iterator + 1 == index
        node = node.next
        idx_iterator += 1
      end
      puts "Node with the Value of '#{node.next.value}' at Index '#{index}' will now be removed."
      node.next = node.next.next
    end
  end

  def to_s
    node = head
    until node.nil?
      print "( #{node.value} ) -> "
      node = node.next
    end
    print '(nil)'
  end
end

my_list = LinkedList.new
my_list.prepend('x')
puts my_list.to_s
my_list.append('1')
my_list.append('2')
my_list.append('3')
my_list.append('4')
my_list.append('5')
my_list.prepend('-1')
# pp my_list.all_nodes
puts my_list.to_s
puts my_list.size
puts "Head = #{my_list.head} with the value '#{my_list.head.value}'"
puts "Tail = #{my_list.tail} with the value '#{my_list.tail.value}'"
puts "Item at index 3 = #{my_list.at(3)} with the value '#{my_list.at(3).value}'"
my_list.pop
my_list.pop
puts my_list.to_s
# puts my_list
puts my_list.contains?('')
puts my_list.contains?('im not in the linked_list')
puts 'searching for 2..'
puts my_list.find('2')
puts 'searching for 3..'
puts my_list.find('3')
puts 'searching for random shit..'
puts my_list.find('not in the list')
puts my_list.to_s
my_list.insert_at('i got inserted', 0)
puts my_list.to_s
my_list.remove_at(0)
puts my_list.to_s
