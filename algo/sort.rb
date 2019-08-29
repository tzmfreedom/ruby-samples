#!/usr/bin/env ruby

def bubble(target)
  (target.length-1).downto(1) do |max|
    max.times do |j|
      if target[j] > target[j+1]
        tmp = target[j]
        target[j] = target[j+1]
        target[j+1] = tmp
      end
    end
  end
  target
end

def quick(target, startIndex, endIndex)
  th = target[endIndex]
  i = startIndex
  (startIndex..endIndex).each do |j|
    if target[j] < th
      tmp = target[j]
      target[j] = target[i]
      target[i] = tmp
      i += 1
    end
  end
  target[endIndex] = target[i]
  target[i] = th
  if startIndex < i-1
    quick(target, startIndex, i-1)
  end

  if i+1 < endIndex
    quick(target, i+1, endIndex)
  end
end

TARGET = [4, 8, 1, 5, 2, 3, 4, 1, 2]
target = TARGET.dup

quick(target, 0, target.length-1)
pp target
pp bubble(TARGET.dup)
