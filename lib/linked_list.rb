class LinkedList
  attr_reader :head

  def push(data)
    if head
      head.push(data)
    else
      @head = Node.new(data)
    end
  end

  def pop
    if head.link?
      head.pop
    else
      result = head.data
      @head = nil
      return result
    end
  end

  def count
    return 0 unless head
    head.count
  end
end

class Node
  attr_reader :link, :data

  def initialize(data)
    @data = data
  end

  def count
    link ? 1 + link.count : 1
  end

  def push(data)
    if link
      link.push(data)
    else
      @link = Node.new(data)
    end
  end

  def pop
    if link && link.link?
      link.pop
    else
      output = link.data
      @link = nil
      return output
    end
  end

  def link?
    link
  end
end
