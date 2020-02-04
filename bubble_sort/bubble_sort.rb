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

def bubble_sort_by(arr)
 raise 'No block_given' unless block_given?
 if yield(arr)
  arr.each do
   arr.each_with_index do |i, index|
    next if index == arr.length - 1
    if arr[index] < arr[index + 1]
     arr[index], arr[index + 1] = arr[index + 1], arr[index] 
    end
   end
  end
 end
 arr
end

bubble_sort_by(["hi","hello","hey"]) do |left,right|
 left.length - right.length
end