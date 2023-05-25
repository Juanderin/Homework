#0(n^2) is bubble sort 

#sluggish octopus 
class Bubble 


    def self.bubble_sort(arr, prc)

        sorted = false 

        until sorted 

            sorted = true 

            (0...arr.length - 1).each do |i|
                case prc.call(arr[i].length, arr[i + 1].length)
                when 1 
                    arr[i], arr[i + 1] = arr[i + 1], arr[i]
                    sorted = false 
                end 
            end 
        end 


        arr.last


    end 



end

# fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
#     'fiiiissshhhhhh']

# the_check = Proc.new { |x, y| x <=> y }
# p Bubble.bubble_sort(fish, the_check)


#O(n*lg(n)) is merge sort

#dominant octopus
class Merge 


    def self.merge_sort(arr, prc)

        mid = arr.length / 2

        return arr if arr.length <= 1

        left = arr.take(mid)
        right = arr.drop(mid)


        merge(merge_sort(left, prc), merge_sort(right, prc), prc)


    end 


    def self.merge(left, right, prc)

        sorted = []


        until left.empty? || right.empty?
            case prc.call(left.first.length, right.first.length)
            when -1 
                sorted << left.shift 
            when 0
                sorted << left.shift 
                sorted << right.shift 
            when 1 
                sorted << right.shift 
            end 
        end 

       sorted.concat(left).concat(right)

        # sorted.fetch(-1, nil)


    end 


end 



# fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
#     'fiiiissshhhhhh']
# the_check = Proc.new { |x, y| x <=> y }
# array = Merge.merge_sort(fish, the_check)
# p array.last



#O(n) is simple iteration?

#clever Octopus 


class Iter 


    def self.clever(arr)


        longest = ""


        arr.each do |ele|
            if ele.length >= longest.length
                longest = ele
            end 
        end 

        longest 


    end 

end 

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
    'fiiiissshhhhhh']

p Iter.clever(fish)



    def slow_dance(target, arr)
        
        
        arr.each.with_index do |ele, i|
            if ele == target 
                return i
            end 
        end 



    end 



tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", 
"left",  "left-up"]

p slow_dance("up", tiles_array)
# > 0

p slow_dance("right-down", tiles_array)
# > 3

