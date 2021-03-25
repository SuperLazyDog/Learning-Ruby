# def calculateTotalRegion(heights)
#     # Write your code here
#     sum = 0
#     length = heights.length
#     heights.each.with_index do |h, i|
#         ssum = 0
#         l = i; r = i + 1 # skip self as left shift already processed it
#         while (l >= 0)
#             if h >= heights[l]
#                 ssum += 1
#             else
#                 break
#             end
#             l -= 1
#         end
#         while (r < length)
#             if h >= heights[r]
#                 ssum += 1
#             else
#                 break
#             end
#             r += 1
#         end
#         sum += ssum
#     end
#     return sum
# end
heights = [1, 2, 1]
heights = [1, 1 ,1 ,1]
def calculateTotalRegion(heights)
    # Write your code here
    sum = 0
    length = heights.length
    heights.each.with_index do |h, i|
        ssum = 1
        l = i - 1; r = i + 1 # skip self as left shift already processed it
        lend = false; rend = false
        while true
            if l >= 0
                if h >= heights[l]
                    puts "l: #{heights[l]}"
                    ssum += 1
                end
                l -= 1
            else
                lend = true
            end
            if r < length
                if h >= heights[r]
                    puts "r: #{heights[r]}"
                    ssum += 1
                end
                r += 1
            else
                rend = true
            end
            if lend && rend
                break
            end
        end
        puts " h: #{h}, ssum: #{ssum}"
        sum += ssum
    end
    return sum
end

puts calculateTotalRegion(heights)
