gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'

class LinkedListTest < Minitest::Test
  def test_it_exists
    assert LinkedList
  end

  def test_it_inserts_an_element
    list = LinkedList.new
    assert_equal 0, list.count
    list.push("hello")
    assert_equal 1, list.count
  end

  def test_it_inserts_multiple_elements
    list = LinkedList.new
    assert_equal 0, list.count
    list.push("hello")
    list.push("world")
    assert_equal 2, list.count
  end

  def test_it_stores_and_retrieves_the_data
    list = LinkedList.new
    list.push("hello")
    list.push("world")
    assert_equal "world", list.pop
    assert_equal "hello", list.pop
  end

end

class NodeTest < Minitest::Test
  def test_it_counts_one_when_there_is_no_link
    node = Node.new("hi")
    assert_equal 1, node.count
  end

  def test_it_counts_one_more_than_links_count
    node = Node.new("hi")
    node.push("world")
    assert_equal 2, node.count
  end

  def test_it_pops_the_link_when_there_are_no_other_children
    node = Node.new("hi")
    node.push("world")
    assert_equal "world", node.pop
  end

  def test_pop_removes_the_last_element
    node = Node.new("hi")
    node.push("world")
    assert_equal 2, node.count
    node.pop
    assert_equal 1, node.count
  end
end
