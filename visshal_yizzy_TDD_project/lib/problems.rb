def my_uniq(arr)
    new_arr = []
    arr.each {|ele| new_arr << ele unless new_arr.include?(ele)}
    new_arr
end


class Array

    def two_sum
        arr = []
        (0...self.length - 1).each do |i| 
          (i + 1...self.length).each do |j|
            arr << [i,j] if self[i] + self[j] == 0 
          end
        end
        arr  
    end
end  

def my_transpose(arr)
  new_arr = Array.new(arr.length){Array.new(arr[0].length)}
  (0...arr.length).each do |i|
    (0...arr.length).each do |j|
       new_arr[j][i] = arr[i][j] 
    end   
   end
  new_arr
end
