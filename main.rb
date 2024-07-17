# frozen_string_literal: true

# Using iteration, write a method #fibs which takes a number and returns an array
def fibs(n)
  array = []
  (0...n).each do |i|
    if i < 2
      array.push(i)
    else
      array.push(array[i - 1] + array[i - 2])
    end
  end
  array
end

# Now write another method #fibs_rec which solves the same problem recursively.
def fibs_rec(n)
  array = [0, 1]
  return array.take(n) if n < 3

  preceding = fibs_rec(n - 1)
  preceding.push(preceding[-1] + preceding[-2])
end

# Build a method #merge_sort that takes in an array and returns a sorted array, using a recursive merge sort methodology
def merge_sort(arr)
  return arr if arr.size == 1

  # base case, return array if it contains 1 item

  merged = []
  # Split the array and call merge_sort on both
  sub1 = merge_sort(arr[0...arr.size / 2])
  sub2 = merge_sort(arr[arr.size / 2..])

  # Compare the first items of both arrays, and move the lower value to the merged array, until 1 of both is empty
  sub1[0] < sub2[0] ? merged.push(sub1.shift) : merged.push(sub2.shift) until sub1.empty? || sub2.empty?
  # When 1 is empty, the other can be added to the merged array entirely
  sub1.empty? ? merged.concat(sub2) : merged.concat(sub1)

  merged
end