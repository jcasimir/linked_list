gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'

class LinkedListTest < Minitest::Test
  attr_reader :list

  def setup
    @list = LinkedList.new
  end

  def test_it_inserts_multiple_elements
    assert_equal 0, list.count
    list.push("hello")
    list.push("world")
    assert_equal 2, list.count
  end

  def test_it_stores_and_retrieves_the_data
    list.push("hello")
    list.push("world")
    assert_equal "world", list.pop
    assert_equal "hello", list.pop
  end

  def test_it_converts_to_an_array_with_multiple_elements
    list.push("hello")
    list.push("world")
    assert_equal ["hello", "world"], list.to_a
  end

  def test_it_deletes_data
    list.push("hello")
    list.push("world")
    list.push("goes")
    list.push("boom")
    assert_equal 4, list.count
    list.delete("world")
    assert_equal 3, list.count
    assert_equal "boom", list.pop
    assert_equal "goes", list.pop
    assert_equal "hello", list.pop
  end

  def test_it_deletes_the_last_element_from_the_list
    list.push("hello")
    list.push("world")
    list.delete("world")
    assert_equal 1, list.count
    assert_equal "hello", list.pop
  end

  def test_it_deletes_the_only_element
    list.push("hello")
    list.delete("hello")
    assert_equal 0, list.count
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
