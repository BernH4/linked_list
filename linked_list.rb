# frozen_string_literal: true
require 'pry'
require 'colorize'
require_relative 'node.rb'
require 'ap'

class LinkedList
  attr_accessor :head, :all_nodes
  def initialize
    @head = nil
    @all_nodes = []
  end

  def append(value)
    node = Node.new
    all_nodes << node
    node.value = value
    #binding.pry
    if self.head == nil
      self.head = node 
    else
      temp_node = self.head
      until temp_node.next == nil
        temp_node = temp_node.next
      end
      temp_node.next = node
    end
  end
  def to_s
    binding.pry
    node = self.head
    print "( #{node.value} )"
    until node.next == nil
      node = node.next
      print "( #{node.value} ) -> "
    end
  end
end

myList = LinkedList.new

myList.append("1")
myList.append("2")
myList.append("3")
myList.append("4")
myList.append("5")
#pp myList.all_nodes
puts myList
#puts myList
