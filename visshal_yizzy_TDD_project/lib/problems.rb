def my_uniq(arr)
    new_arr = []
    arr.each {|ele| new_arr << ele unless new_arr.include?(ele)}
    new_arr
end