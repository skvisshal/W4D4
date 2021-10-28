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

def stock_picker(arr)
    new_arr = []
    max = 0
    (0...arr.length-1).each do |i|
        (i+1...arr.length).each do |j|
            if arr[j] - arr[i] > max
                max = arr[j] - arr[i]
                new_arr = [i,j]
            end
        end
    end
    new_arr
end

class Towers

    attr_accessor :tower_1, :tower_2, :tower_3
    def initialize
        @tower_1 = [4,3,2,1]
        @tower_2 = []
        @tower_3 = []
        @tower_hash = {
            1 => @tower_1,
            2 => @tower_2,
            3 => @tower_3
        }
    end

    def move(from_tower, to_tower)
        to_tower << from_tower.pop
    end

    def won?
        @tower_1 == [] && @tower_2 == [] && @tower_3 = [4,3,2,1]
    end

    def play

        until self.win?
            self.turn
        end
        puts "You Won"
    end

    def turn 
        puts "Enter from and dest towers like 1 2"
        response = gets.chomp.split.map(&:to_i)
        self.move(@tower_hash[response[0]],@tower_hash[response[1]])
    end

end
