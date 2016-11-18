module Enumerable
  
  # Create #my_each, a method that is identical to #each but (obviously) does
  # not use #each. You'll need to remember the yield statement. Make sure it
  # returns the same thing as #each as well.
  def my_each
    if block_given?
      self_array = self.to_a
      (self_array.length).times do |item|
        yield self_array[item]
      end
      self_array
    else
      self.to_enum
    end
  end
  
  # Create #my_each_with_index in the same way.
  def my_each_with_index
    if block_given?
      self_array = self.to_a
      (self_array.length).times do |item|
        yield self_array[item], item
      end
      self_array
    else
      self.to_enum
    end
  end
  
  # Create #my_select in the same way, though you may use #my_each in your
  # definition (but not #each).
  def my_select
    if block_given?
      filter = []
      self.my_each do |item|
        if yield item
          filter.push(item)
        end
      end
      filter
    else
      self.to_enum
    end
  end
  
  # Create #my_all? (continue as above)
  def my_all?
    if block_given?
      if self.my_select { |item| yield item }.length < self.length
        return false
      else
        true
      end
    else
      !self.my_any? { |x| x == nil || x == false }
    end
  end
  
  # Create #my_any?
  def my_any?
    if block_given?
      if self.my_select { |item| yield item } == []
        return false
      else
        true
      end
    else
      self.my_any? { |x| x }
    end
  end
  
  # Create #my_none?
  def my_none?
    if block_given?
      if self.my_select { |item| yield item } == []
        return true
      else
        false
      end
    else
      self.my_all? { |x| !x }
    end
  end
  
  # Create #my_count
  def my_count(*equal)
    if block_given?
      self.my_select { |item| yield item }.length
    elsif equal.length == 1
      self.my_select { |item| item == equal[0] }.length
    else
      self.length
    end
  end
  
  # Create #my_map
  
  # Modify your #my_map method to take a proc instead.

  # Modify your #my_map method to take either a proc or a block. It won't be
  # necessary to apply both a proc and a block in the same #my_map call since
  # you could get the same effect by chaining together one #my_map call with the
  # block and one with the proc. This approach is also clearer, since the user
  # doesn't have to remember whether the proc or block will be run first. So if
  # both a proc and a block are given, only execute the proc.
  def my_map(&proc)
    if block_given?
      map_array = []
      (self.length).times do |item|
        map_array.push(proc.call self[item])
      end
      map_array
    else
      self.to_enum
    end
  end

  # Create #my_inject
  def my_inject(*args)
    start = args.empty? ? 1 : 0
    memo = args[0] ||= self.to_a[0]
    self_array = self.to_a
    
    if memo.is_a?(Symbol)
      memo = self.my_inject { |sum, n| sum.method(memo).call(n) }
    elsif args[1].is_a?(Symbol)
      memo = self.my_inject(args[0]) { |sum, n| sum.method(args[1]).call(n) }
    elsif block_given?
      (start...self_array.length).my_each do |item|
        memo = yield memo, self_array[item]
      end
      memo
    end
  end
  
end

# Test your #my_inject by creating a method called #multiply_els which
# multiplies all the elements of the array together by using #my_inject.
def multiply_els array
  array.my_inject {|product, item| product * item}
end
p multiply_els([2,4,5])                             #=> 40
