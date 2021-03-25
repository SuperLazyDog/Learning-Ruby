def cardPackets(cardTypes)
    # Write your code here
    length = cardTypes.length
    max = cardTypes.max
    sums = []
    (2..max).each do |i|
        sum = 0
        cardTypes.each do |c|
            sum += c % i
        end
        sums.push sum
    end
    return sums.min
end
