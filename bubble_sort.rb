def bubble_sort arr
 arr.each do
  arr.each_with_index do |i, index|
   next if index == arr.length - 1
   if arr[index] > arr[index + 1]
    arr[index], arr[index + 1] = arr[index + 1], arr[index] 
   end
  end
 end
end

puts bubble_sort([4,3,78,2,0,2])