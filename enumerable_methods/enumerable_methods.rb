module Enumerable
  
  # Create #my_each, a method that is identical to #each but (obviously) does
  # not use #each. You'll need to remember the yield statement. Make sure it
  # returns the same thing as #each as well.
  def my_each
    if block_given?
      (self.length).times do |item|
        yield self[item]
      end
      self
    else
      self.to_enum
    end
  end
  
  # Create #my_each_with_index in the same way.
  def my_each_with_index
    if block_given?
      (self.length).times do |item|
        yield self[item], item
      end
      self
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

  # Test your #my_inject by creating a method called #multiply_els which
  # multiplies all the elements of the array together by using #my_inject, e.g.
  # multiply_els([2,4,5]) #=> 40
  def my_inject(*args)
    memo = 0
    total = args[0] ||= 0
    if block_given?
      (self.to_a.length).times do |item|
       total += yield memo, self.to_a[item]
      end
      total
    else
      self.to_enum
    end
  end
end

# a = [ "a", "b", "c", "d" ]
# p a.my_map { |x| x + "!" }
# my_proc = Proc.new { |x| x + "**" }
# p a.my_map(&my_proc)

p (5..10).my_inject(5) { |sum, n| sum * n }