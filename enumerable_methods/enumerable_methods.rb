module Enumerable
  def my_each
    array = if self.class == Array
      self
    elsif self.class == Range
      to_a
    else
      flatten
    end

    i = 0
    while i < array.length
      if self.class == Hash
        yield(array[i], array[i + 1])
        i += 2
      else
        yield(array[i])
        i += 1
      end
    end
  end

  def my_each_with_index
    array = if self.class == Array
      self
    elsif self.class == Range
      to_a
    else
      flatten
    end

    i = 0
    while i < array.length
      yield(array[i], i)
      i += 1
    end
  end

  def my_select
    array = if self.class == Array
      self
    elsif self.class == Range
      to_a
    else
      flatten
    end

    arr = []
    i = 0
    while i < array.length
      if self.class == Hash
        yield(array[i], array[i + 1])
        i += 2
      else
        arr << array[i] if yield(array[i])
        i += 1
      end
    end
    arr
  end

  def my_all?
    array = if self.class == Array
      self
    elsif self.class == Range
      to_a
    else
      flatten
    end

    i = 0
    boolean = true
    array.length.times do |i|
      if !yield(array[i])
        boolean = !boolean
        break
      end
    end
    boolean
  end

  def my_any?
    array = if self.class == Array
      self
    elsif self.class == Range
      to_a
    else
      flatten
    end

    i = 0
    boolean = false
    while i < array.length
      if yield(array[i])
        boolean = !boolean
        break
      end
      i += 1
    end
    boolean
  end

  def my_none?
    array = if self.class == Array
      self
    elsif self.class == Range
      to_a
    else
      flatten
    end

    i = 0
    boolean = true
    array.length.times do |i|
      if yield(array[i])
        boolean = !boolean
        break
      end
    end
    boolean
  end

  def my_count(arg = nil)
    if block_given?
      array = if self.class == Array
      self
    elsif self.class == Range
      to_a
    else
      flatten
    end
    i = 0
    count = 0
    while i < array.length
      count += 1 if yield(array[i])
      i += 1
    end
    count
    else
      obj = Hash.new(0)
      i = 0
      while i < self.length
        obj[arg] += 1 if self[i] == arg
        i += 1
      end
      obj.values
    end
  end

  def my_map(&block)
    #using block
    arr = []

    i = 0
    while i < self.length
      arr << yield(self[i])
      i += 1
    end
    arr

    #using proc
    arr = []
    i = 0
    while i < self.length
      arr << block.call(self[i])
      i += 1
    end
    arr
  end

  def my_inject(palceholder = 0)
    array =  if self.class == Array
      self
      elsif self.class == Range
        to_a
      else
        flatten
      end
      
    i = 0
    while i < array.length
      palceholder = yield(palceholder, array[i])
      i += 1
    end
    palceholder
  end

  def multiple_els(arr)
    arr.my_inject {|acc, val| acc * val}
  end
end