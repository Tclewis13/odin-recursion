require 'rubocop'
require 'pry-byebug'

def fibs(number)
  if number == 1 then 0
  elsif number == 2 then 1
  else
    fibs(number - 1) + fibs(number - 2)
  end
end

def fibonacci_sequence(fib_length)
  result = []
  for i in 0..fib_length - 1
    result << fibs(i + 1)
  end
  result
end

def merge_sort(arr)
  return arr if arr.length <= 1

  mid = (arr.length / 2).round
  left_side = arr[0...mid]
  right_side = arr[mid...arr.length]
  sorted_left = merge_sort(left_side)
  sorted_right = merge_sort(right_side)
  merge(arr, sorted_left, sorted_right)
end

def merge(arr, left, right)
  i = 0
  j = 0
  k = 0

  while i < left.length && j < right.length
    if left[i] <= right[j]
      arr[k] = left[i]
      i += 1
    else
      arr[k] = right[j]
      j += 1
    end
    k += 1
  end

  while i < left.length
    arr[k] = left[i]
    i += 1
    k += 1
  end

  while j < right.length
    arr[k] = right[j]
    j += 1
    k += 1
  end

  arr
end

arr = [12, 11, 13, 5, 6, 7]
merge_sort(arr)
puts arr
# puts fibonacci_sequence(8)
