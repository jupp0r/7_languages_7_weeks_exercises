# -*- coding: utf-8 -*-
class Tree
  attr_accessor :children, :node_name
  
  def initialize *args
    case args.size
      when 1
      top, child_hash = args[0].shift
      @node_name = top
      @children = Tree.construct_tree child_hash
      when 2
      @node_name = args[0]
      @children = args[1]
    end
end

  def self.construct_tree(hash_name)
    if hash_name.empty?
      return []
    else
      return_list = Array.new
      hash_name.each { |key, val| return_list.push(Tree.new(key, Tree.construct_tree(val))) }
      return return_list
    end
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  
  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new({'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } })

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
