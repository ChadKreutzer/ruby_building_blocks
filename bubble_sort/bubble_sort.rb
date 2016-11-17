# Build a method #bubble_sort that takes an array and returns a sorted array.
# It must use the bubble sort methodology (using #sort would be pretty
# pointless, wouldn't it?).

#     > bubble_sort([4,3,78,2,0,2])
#     => [0,2,2,3,4,78]

def bubble_sort(test_array)
  temp = false
  until temp == true do
    temp = true
    (0...test_array.length - 1).each do |x|
      if test_array[x] > test_array[x + 1]
        temp = test_array[x]
        test_array[x] = test_array[x + 1]
        test_array[x + 1] = temp
      end
    end
  end
  test_array
end

bubble_sort([4,3,6,2,1,8,7])

# Now create a similar method called #bubble_sort_by which sorts an array
# but accepts a block. The block should take two arguments which represent
# the two elements currently being compared. Expect that the block's return
# will be similar to the spaceship operator you learned about before -- if
# the result of the block is negative, the element on the left is "smaller"
# than the element on the right. 0 means they are equal. A positive result
# means the left element is greater. Use this to sort your array.

#     > bubble_sort_by(["hi","hello","hey"]) do |left,right|
#     >   left.length - right.length
#     > end
#     => ["hi", "hey", "hello"]

def bubble_sort_by(test_array)
  temp = false
  until temp == true do
    temp = true
    (0..test_array.length -1).each do |x|
      