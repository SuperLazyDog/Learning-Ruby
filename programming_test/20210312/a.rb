def isPrime(n)
    # Write your code here
    if (n == 2 || n == 1)
        return 1
    end
    if (n % 2 ==0)
        return 2
    else
        i = 3
        while i < n
            if n % i == 0
                return i
            end
            i += 2
        end
    end
    return 1
end
