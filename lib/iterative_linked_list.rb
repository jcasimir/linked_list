class IterativeLinkedList
  attr_reader :head

  def count
    if head.nil?
      0
    else
      count = 1
      current = head
      while current.link?
        count += 1
        current = current.link
      end
      count
    end
  end

  def push(data)

    if head.nil?
      @head = Node.new(data)
    else
      target = head
      while target.link?
        target = target.link
      end
      target.link = Node.new(data)
    end
  end

  def pop
    current = head
    last = nil
    while current.link?
      last = current
      current = current.link
    end

    if last.nil?
      @head = nil
    else
      last.link = nil
    end

    current.data
  end

  def delete(target)
    if head.data == target
      @head = head.link
    else
      current = head
      last = nil
      while current.link?
        last = current
        current = current.link

        if current.data == target
          last.link = current.link
        end
      end
    end 
  end

  def to_a
    result = []
    current = head
    while current
      result << current.data
      current = current.link
    end
    return result
  end
end

class Node
  attr_accessor :link
  attr_reader :data

  def initialize(input_data)
    @data = input_data
  end

  def link?
    link
  end
end