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

  def delete(match)
    if link? && link.data == match
      @link = link.link
    else
      link.delete(match)
    end
  end

  def to_a
    if link
      [data] + link.to_a
    else
      [data]
    end
  end
end

class LinkedList < Node
  def initialize
  end

  def count
    link? ? link.count : 0
  end

  def to_a
    if link?
      link.to_a
    else
      []
    end
  end
end
